<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    int n = 0;
    boolean click = false;
    
    try {
        if(request.getParameter("resultFib")!=null){
            click = true;
            n = Integer.parseInt(request.getParameter("nFib"));
        }    
    }catch (Exception e) {errorMessage = e.getMessage();}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fibonacci</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Fibonacci</h1>
        <h2>digite seu número:</h2>
        <form>
            <input type="number" name="nFib"/>
            <input type="submit" name="resultFib"/>
        </form>
        
        <%if(errorMessage==null){%>
            <%if(click==true){%>
                <table border='1'>
                    <tr>
                        <th>Fibonacci até <%=n%></th>
                        <%int a=0, b=1;
                        while(a <= n){%>
                            <td><%=a%></td>
                            <%int c = a + b;
                            a = b;
                            b = c;
                        }%>
                    </tr>
                </table>
            <%}%>
        <%}else{%>
            <div style="color:red"><%=errorMessage%></div>
        <%}%>
    </body>
</html>
