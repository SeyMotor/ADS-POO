<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    int n = 0;
    boolean click = false;
    
    try {
        if(request.getParameter("resultSoma")!=null){
            click = true;
            n = Integer.parseInt(request.getParameter("nSoma"));
        }    
    }catch (Exception e) {errorMessage = e.getMessage();}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Soma</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Soma</h1>
        <h2>digite seu número:</h2>
        <form>
            <input type="number" name="nSoma"/>
            <input type="submit" name="resultSoma"/>
        </form>
        
        <%if(errorMessage==null){%>
            <%if(click==true){%>
            <h3>Número: <%=n%></h3>
            
            <h3>Soma: <%int sum=0;
                for(int i=1;i<=n;i++)
                    sum+=i;%>
                <%=sum%>
            </h3>
            <%}%>
        <%}else{%>
            <div style="color:red"><%=errorMessage%></div>
        <%}%>
    </body>
</html>
