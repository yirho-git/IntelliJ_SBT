<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<h2>Detail</h2>
<form action="default" method="post" id="mForm">
    <input type="text" name="userNo" id="no" value="${member.userNo}" hidden="hidden">
    <table border="1">
        <tr>
            <th>userId</th>
            <td>
                <input type="text" name="userId" id="id" value="${member.userId}" readonly>
            </td>
        </tr>
        <tr>
            <th>userName</th>
            <td>
                <input type="text" name="userName" id="name" value="${member.userName}" readonly>
            </td>
        </tr>
        <tr>
            <th>auth - 1</th>
            <td>
                <div id="authBox1" hidden="hidden">
                    <select name="authList[0].auth" style="display: block; ">
                        <c:choose>
                            <c:when test="${member.authList[0].auth eq 'ROLE_USER'}">
                                <option value="ROLE_USER" selected>사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:when test="${member.authList[0].auth eq 'ROLE_MEMBER'}">
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER" selected>회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:when test="${member.authList[0].auth eq 'ROLE_ADMIN'}">
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN" selected>관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:otherwise>
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="" selected>선택해주세요</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${member.authList[0].auth eq 'ROLE_USER'}">
                            사용자
                        </c:when>
                        <c:when test="${member.authList[0].auth eq 'ROLE_MEMBER'}">
                            회원
                        </c:when>
                        <c:when test="${member.authList[0].auth eq 'ROLE_ADMIN'}">
                            관리자
                        </c:when>
                        <c:otherwise>
                            &nbsp;&nbsp;
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>
        <tr>
            <th>auth - 2</th>
            <td>
                <div id="authBox2" hidden="hidden">
                    <select name="authList[1].auth" style="display: block; ">
                        <c:choose>
                            <c:when test="${member.authList[1].auth eq 'ROLE_USER'}">
                                <option value="ROLE_USER" selected>사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:when test="${member.authList[1].auth eq 'ROLE_MEMBER'}">
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER" selected>회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:when test="${member.authList[1].auth eq 'ROLE_ADMIN'}">
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN" selected>관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:otherwise>
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="" selected>선택해주세요</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${member.authList[1].auth eq 'ROLE_USER'}">
                            사용자
                        </c:when>
                        <c:when test="${member.authList[1].auth eq 'ROLE_MEMBER'}">
                            회원
                        </c:when>
                        <c:when test="${member.authList[1].auth eq 'ROLE_ADMIN'}">
                            관리자
                        </c:when>
                        <c:otherwise>
                            &nbsp;&nbsp;
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>
        <tr>
            <th>auth - 3</th>
            <td>
                <div id="authBox3" hidden="hidden">
                    <select name="authList[2].auth" style="display: block; ">
                        <c:choose>
                            <c:when test="${member.authList[2].auth eq 'ROLE_USER'}">
                                <option value="ROLE_USER" selected>사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:when test="${member.authList[2].auth eq 'ROLE_MEMBER'}">
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER" selected>회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:when test="${member.authList[2].auth eq 'ROLE_ADMIN'}">
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN" selected>관리자</option>
                                <option value="">선택해주세요</option>
                            </c:when>
                            <c:otherwise>
                                <option value="ROLE_USER">사용자</option>
                                <option value="ROLE_MEMBER">회원</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                <option value="" selected>선택해주세요</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${member.authList[2].auth eq 'ROLE_USER'}">
                            사용자
                        </c:when>
                        <c:when test="${member.authList[2].auth eq 'ROLE_MEMBER'}">
                            회원
                        </c:when>
                        <c:when test="${member.authList[2].auth eq 'ROLE_ADMIN'}">
                            관리자
                        </c:when>
                        <c:otherwise>
                            &nbsp;&nbsp;
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>
    </table>
    <button type="button" id="btnModify">수정폼</button>
    <button type="submit" id="btnMod" formaction="/member/modify" hidden="hidden">수정</button>
    <button type="submit" id="btnDelete" formaction="/member/delete">삭제</button>
    <button type="button" id="btnList">목록</button>
</form>
</body>
<script type="text/javascript">
    $(function () {

        const btnModify = $("#btnModify");
        const btnMod = $("#btnMod");
        const btnList = $("#btnList");

        // 수정폼 버튼
        let modform = false;
        btnModify.on("click", function () {
            let name = $("#name");
            let authBox1 = $("#authBox1");
            let authBox2 = $("#authBox2");
            let authBox3 = $("#authBox3");

            if (!modform) {
                name.prop("readonly", false);
                authBox1.show();
                authBox1.siblings("div").hide();
                authBox2.show();
                authBox2.siblings("div").hide();
                authBox3.show();
                authBox3.siblings("div").hide();
                btnModify.hide();
                btnMod.show();
                modform = !modform;
            }
        });

        btnList.on("click", function () {
            location.href = "/member/list";
        });
    });
</script>
</html>