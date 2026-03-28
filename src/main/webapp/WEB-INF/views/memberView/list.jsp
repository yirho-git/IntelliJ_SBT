<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h2>List</h2>

<input type="text" name="search" id="search" value=""/>&nbsp;<button type="button" id="schBtn">검색</button>

<a href="/member/register">등록</a>
<a href="/member/list">전체목록</a>
<table border="1">
    <thead>
        <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>사용자명</th>
            <th>작성일</th>
        </tr>
    </thead>
    <tbody class="list-body">
        <c:forEach var="m" items="${memberList}">
            <tr>
                <td>${m.userNo }</td>
                <td>
                    <a href="/member/read?userNo=${m.userNo}">${m.userId}</a>
                </td>
                <td>${m.userPw }</td>
                <td>${m.userName }</td>
                <td>
                    <fmt:formatDate value="${m.regDate}" pattern="yyyy.MM.dd HH:mm"/>
                </td>
            </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script type="text/javascript">
    const schBtn = document.getElementById("schBtn");

    // 검색 버튼 기능
    schBtn.addEventListener("click", async function () {

        const keyword = document.querySelector("#search").value;

        const resp = await fetch(`/member/searchList?keyword=\${encodeURIComponent(keyword)}`, {
            method: "GET"
        });

        const data = await resp.json();
        console.log("***** data : ",data);

        const listBody = document.querySelector(".list-body");

        let html = "";

        data.forEach(m => {
            const date = new Date(m.regDate);
            const formattedDate = date.toLocaleString();

            html += `
			<tr>
				<td>\${m.userNo }</td>
				<td>
					<a href="/member/read?userNo=\${m.userNo}">\${m.userId}</a>
				</td>
				<td>\${m.userPw }</td>
				<td>\${m.userName }</td>
				<td>
					\${formattedDate}
				</td>
			</tr>
			`
        });

        listBody.innerHTML = html;
    });


</script>
</html>