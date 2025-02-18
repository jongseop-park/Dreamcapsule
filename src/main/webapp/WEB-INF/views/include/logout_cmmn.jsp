
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Message</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">로그아웃 시 세션이 종료됩니다. 로그아웃을 하시겠습니까?</div>
            <div class="modal-footer">
<%--                <form action="/logout" method="post">--%>
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <a class="btn btn-primary" href="/logout">로그아웃</a>
<%--                </form>--%>
            </div>
        </div>
    </div>
</div>
