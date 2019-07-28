<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="fileUploadForm" action="fileUpload" method="post" enctype="multipart/form-data">
        <input type="file" id="fileUpload" name="fileUpload"/><br/><br/>
        <input type="file" id="fileUpload2" name="fileUpload2"/><br/><br/>
        <input type="button" value="전송" onClick="fileSubmit();">
    </form>
 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    function fileSubmit() {
    	var csrfHeaderName ="${_csrf.headerName}"; 
    	var csrfTokenValue="${_csrf.token}";

    	  
        var formData = new FormData($("#fileUploadForm")[0]);
        $.ajax({
            type : 'post',
            url : '/fileUpload',
            processData: false, 
            contentType: false,
            data: formData,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            success : function(html) {
                alert("파일 업로드하였습니다.");
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }
</script>

</body>
</html>