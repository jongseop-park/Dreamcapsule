package com.dreamcapsule.project.config;

import com.dreamcapsule.project.apps.admin.service.CustomUserDetailsService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity // Spring Security 설정할 클래스로 정의
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter { // WebSecurityConfigurer 인스턴스를 편리하게 생성하기 위한 클래스

    /*
    * SecurityConfig를 만든 목적은 로그인 기능을 구현하기 위함. pom.xml에 security를 추가하여 처리
    * Security를 통해 계정의 권한을 부여하여 기능에 제한을 둠둠
    * 세션 - 쿠키 방식의 인증
    * http 기본인증
    * json token
    * session
    * cookie
   * */

    @Autowired
    public CustomUserDetailsService customUserDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(); // 비밀번호 암호화 객체. Service에서 비밀번호를 암호화할 수 있도록 Bean으로 등록.
    }

    @Override
    public void configure(WebSecurity web) throws Exception{ // WebSecurity는 FilterChainProxy를 생성하는 필터.
        // static 디렉터리의 하위 파일 목록은 인증 무시 ( = 항상 통과 )
        web.ignoring().antMatchers("/static/**"); // 이 경로의 파일들은 Spring Security가 무시하도록 설정.
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception { // HttpSecurity를 통해 HTTP 요청에 대한 웹 기반 보안을 구성.
        http.authorizeRequests() // HttpServletRequest에 따라 접근을 제한함.
                // 페이지 권한 설정
                .antMatchers("/admin/**").hasRole("ADMIN") // 괄호의 권한을 가진 유저만 접근가능, ROLE_가 붙어서 적용 됨. 즉, 테이블에 ROLE_권한명 으로 저장해야 함.
                                                                      // ㄴ /admin으로 시작하는 경로는 ADMIN 롤을 가진 사용자만 접근 가능.
                .antMatchers("/register").permitAll()
                .antMatchers("/forget-password").permitAll()
//                .antMatchers("/**").permitAll() // 모든 경로에 대해서는 권한없이 접근 가능.
            .and() // 로그인 설정
                .formLogin() // 하위에 내가 직접 구현한 로그인 폼, 로그인 성공시 이동 경로 설정 가능. , 로그인 폼의 아이디,패스워드는 username, password로 맞춰야 함
                .loginPage("/login") // 커스텀 로그인 폼을 사용하기 위한 메서드. 경로가 일치해야 함.
                /*.loginProcessingUrl("/loginProcess") // 로그인form의  action과 일치시켜주어야 함.*/
                .defaultSuccessUrl("/admin/main") // 로그인이 성공했을 때 이동되는 페이지. 컨트롤러에서 매핑이 되어있어야 함.
                .permitAll()
            .and() // 로그아웃 설정
                .logout() // 로그아웃을 지원하는 메서드. WebSecurityConfigurerAdapter를 사용할 때 자동으로 적용. 기본적으로 /logout 접근 시 HTTP 세션을 제거함.
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout")) // 로그아웃의 기본 URL(/logout)이 아닌 다른 URL로 재정의.
                .logoutSuccessUrl("/login")
                .invalidateHttpSession(true) // HTTP 세션을 초기화.
            .and() // 403 예외처리 핸들링
                .exceptionHandling().accessDeniedPage("/error") // 권한이 없는 대상이 접속을 시도했을 때
            .and()
                .csrf().disable() // Security 미사용
        ;
    }
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception{
        auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
    }

}

// ==================================================================================================================

/*      로그인 설정
*      http.formLogin()
*       .loginPage("/")
        .loginPage("/login") 로그인 페이지는 /, /login (같은 페이지)두 페이지 에서 로그인을 실행할 것이다
        .loginProcessingUrl("/login-processing") 로그인 버튼을 누를시 /login-processing 경로로
        .failureUrl("/login-error") 로그인을 실패 할 경우 /login-error
        .defaultSuccessUrl("/home", true) 로그인이 성공할 경우 기본 페이지는 /home
        .usernameParameter("id") 로그인시 파라미터로 "id", "password"를 받습니다
        .passwordParameter("password");
*/

/*     로그아웃 설정
*      http.logout()
        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
        .logoutSuccessUrl("/")
        .invalidateHttpSession(true);

        /logout 경로로 요청이 들어올 경우 /로 리다이렉트 하고 세션 초기화
\
* */