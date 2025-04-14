<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    int n = 0;
    boolean result = true;
    boolean click = false;
    try{
        if(request.getParameter("resultPrimo")!=null){
            click = true;
            n = Integer.parseInt(request.getParameter("nPrimo"));
            for(int i = 2; i <= n/2; i++){
                if(n%i == 0){
                    result = false;
                    break;
                }
            }
        }
    }catch(Exception ex){
        errorMessage = ex.getMessage();
    } 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Número Primo</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Número Primo</h1>
        <h2>digite seu número:</h2>
        <form>
            <input type="number" name="nPrimo"/>
            <input type="submit" name="resultPrimo"/>
        </form>
        
        <%if(errorMessage==null){%>
            <%if(result==true&&click==true){%>
                <h1><%=n%> é Primo</h1>
            <%}else if (result==false&&click==true){%>
                <h1><%=n%> não é Primo</h1>
                <table border='1'>
                    <tr>
                        <th>números divisíveis</th>
                        <%for(int i = 1; i <= n; i++){%>
                            <%if(n % i == 0){%>
                                <td><%=i%></td>
                            <%}%>
                        <%}%>
                    </tr>
                </table>
            <%}%>
        <%}else{%>
            <div style="color:red"><%=errorMessage%></div>
        <%}%>
    </body>
</html>