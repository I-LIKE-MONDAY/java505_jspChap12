<%--<%@ page import="org.apache.commons.fileupload.DiskFileUpload" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- 고정 추가 하기 --%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%-- 3개 추가 끝 --%>
<!DOCTYPE html>
<html>
<head>
    <title>파일 사용하기</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String fileUploadPath = "C:\\java505git\\upload";

    DiskFileUpload upload = new DiskFileUpload();
//    alt + Enter => 클래스 가져오기 (java.util)
    List items = upload.parseRequest(request);
//    반복 가능한 객체로 생성
    Iterator params = items.iterator();

//    hasNext() : 다음 데이터가 존재하는지 확인
    while (params.hasNext()) {
//        next() : 다음 데이터를 가져옴
        FileItem fileItem = (FileItem) params.next();

//        FormField가 맞는지 확인
        if (!fileItem.isFormField()) {
//            FormField가 아니라면 file 객체가 가지고있는 이름 가져옴
            String fileName = fileItem.getName();
//            lastIndexOf : 가장 마지막에 나온 \\ 의 인덱스번호 추출
            fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
//            저장할경로 + / + 파일이름
            File file = new File(fileUploadPath + "/" + fileName);
//            실제 파일 저장
            fileItem.write(file);
        }
    }
%>
</body>
</html>
