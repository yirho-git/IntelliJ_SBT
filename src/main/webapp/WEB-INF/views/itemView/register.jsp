<%--
  Created by IntelliJ IDEA.
  User: PC-24
  Date: 2026-03-27
  Time: 오후 7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>REGISTER FORM</title>
</head>
<body>
<h1>REGISTER</h1>
<form action="/register" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <th>상품명</th>
            <td>
                <input type="text" name="itemName" value=""/>
            </td>
        </tr>
        <tr>
            <th>가격</th>
            <td>
                <input type="text" name="price" value=""/>
            </td>
        </tr>
        <tr>
            <th>파일</th>
            <td>
                <input type="file" name="inputFile"/>
            </td>
        </tr>
        <tr>
            <th>개요</th>
            <td>
                <textarea name="description" id="" cols="30" rows="10"></textarea>
            </td>
        </tr>
    </table>
    <button type="submit" id="registerBtn">Register</button>
    <button type="button" id="listBtn">list</button>
</form>
</body>
<script type="text/javascript">

    let inputFile = document.querySelector('input[name="inputFile"]');
    // 파일 선택시
    inputFile.addEventListener("change", async function (e) {
        console.log("File selected...!");

        let files = e.target.files;
        let file = files[0];    // 내가 선택한 파일(multiple이 아니기에 첫번째만 가져와도 됨)

        let formData = new FormData();  // ajax 비동기 통신을 위한 FormData생성 (편지봉투)
        formData.append("file", file);  // 위에 가져온 파일을 form에 첨부  (내용물)

        try {
            const resp = await fetch("/item/uploadFile",{
                method:"POST",
                body:formData
            });

            const data = await resp.json();
        } catch (err) {
            console.log(err);
        }
    });

    const listBtn = document.querySelector("#listBtn");
    listBtn.addEventListener("click", function () {
        location.href = "/item/list";
    });
</script>
</html>