<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage=null;
    float vlCapital=0;
    float pcTaxa=0;
    int qtTempo=0;
    float vlMontante=0;
    boolean click=false;
    
    try {
        if(request.getParameter("resultJuros")!=null){
            vlCapital = Float.parseFloat(request.getParameter("nCapital"));
            pcTaxa = Float.parseFloat(request.getParameter("nTaxa"));
            qtTempo = Integer.parseInt(request.getParameter("nTempo"));
            click = true;
        }    
    }catch (Exception e) {errorMessage = e.getMessage();}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Compostos</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Juros Compostos</h1>
        
        <%@include file="WEB-INF/jspf/formJuros.jspf"%>
        
        <%if(errorMessage == null){%>
            <%if(click == true){%>
                <h3>Montante:</h3>
                <table border='1'>
                    <%for(int i=1; i<=qtTempo; i++){%>
                        <tr>    
                            <th>Mês <%=i%></th>
                            <%vlMontante = vlCapital*((float)Math.pow((1 + (pcTaxa/100)), i));%>
                            <td><%=String.format("%.2f", vlMontante)%></td>
                        </tr>
                    <%}%>
                </table>
                <h3>Taxa de Juros:</h3>
                <h1><%=String.format("%.0f", pcTaxa)%>%</h1>
                <h3>Meses Taxados:</h3>
                <h1><%=qtTempo%> Meses</h1>
            <%}%>
        <%}else{%>
            <div style="color:red"><%=errorMessage%></div>
        <%}%>
    </body>
</html>
