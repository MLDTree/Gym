<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*,com.jspsmart.upload.*" %>
<html>
<head>
<title>�ļ��ϴ�����ҳ��</title>

</head>
<body background="1.jpg" >
<body>
<p align="center">
<%
	// �½�һ��SmartUpload����
	SmartUpload su = new SmartUpload();
	// �ϴ���ʼ��
	su.initialize(pageContext);
	// �趨�ϴ�����
	// 1.����ÿ���ϴ��ļ�����󳤶ȡ�
	su.setMaxFileSize(40000);
	// 2.�������ϴ����ݵĳ��ȡ�
	su.setTotalMaxFileSize(150000);
	// 3.�趨�����ϴ����ļ���ͨ����չ�����ƣ�,������doc,txt�ļ���
	su.setAllowedFilesList("doc,txt");
	// 4.�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�,��ֹ�ϴ�����exe,bat,jsp,htm,html��չ�����ļ���û����չ�����ļ���
	su.setDeniedFilesList("exe,bat,jsp,htm,html");
	// �ϴ��ļ�
	su.upload();
	// ���ϴ��ļ�ȫ�����浽ָ��Ŀ¼
	int count = su.save("/upload");
	out.println(count+"���ļ��ϴ��ɹ���<br>");
	// ��һ��ȡ�ϴ��ļ���Ϣ��ͬʱ�ɱ����ļ���
	for (int i=0;i<su.getFiles().getCount();i++)
	{
		com.jspsmart.upload.File file = su.getFiles().getFile(i);
		// ���ļ����е��ļ�ѡ��û��ѡ���ļ������
		if (file.isMissing()) continue;
		// ��ʾ��ǰ�ļ���Ϣ
		out.println("<TABLE BORDER=1>");
		out.println("<TR><TD>��������FieldName��</TD><TD>"+file.getFieldName()+"</TD></TR>");
		out.println("<TR><TD>�ļ����ȣ�Size��</TD><TD>"+file.getSize()+"</TD></TR>");
		out.println("<TR><TD>�ļ�����FileName��</TD><TD>"+file.getFileName()+"</TD></TR>");
		out.println("<TR><TD>�ļ���չ����FileExt��</TD><TD>" +file.getFileExt()+"</TD></TR>");
		out.println("<TR><TD>�ļ�ȫ����FilePathName��</TD><TD>"+file.getFilePathName()+"</TD></TR>");
		out.println("</TABLE><BR>");
	}
%>
</p>
</body>
</html>