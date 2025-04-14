<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!public static int day(int month, int day, int year) {
        int y = year - (14 - month) / 12;
        int x = y + y/4 - y/100 + y/400;
        int m = month + 12 * ((14 - month) / 12) - 2;
        int d = (day + x + (31*m)/12) % 7;
        return d;
}%>

<%!public static boolean isLeapYear(int year) {
        if  ((year % 4 == 0) && (year % 100 != 0)) return true;
        if  (year % 400 == 0) return true;
        return false;
}%>

<%
    String errorMessage=null;
    int nAno=0;
    int nMes=0;
    String[] meses = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};
    String[] diasDaSemana = {"Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sabado"};
    int[] days = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    int d=0;
    boolean click=false;
    
    try {
        if(request.getParameter("submitCalendario")!=null){
            nMes= Integer.parseInt(request.getParameter("mes"));
            nAno= Integer.parseInt(request.getParameter("ano"));
            if (nMes == 2 && isLeapYear(nAno)) days[nMes] = 29;
            d = day(nMes, 1, nAno);
            click = true;
        }    
    }catch (Exception e) {errorMessage = e.getMessage();}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sey</title>
    </head>
    <body>
        <h1>Calendario</h1>
        <form>
            <input type="number" placeholder="Mês" name="mes" min="1" max="12"> +
            <input type="number" placeholder="Ano" name="ano">
            <input type="submit" name="submitCalendario"/>
        </form>
        
        <%if(errorMessage == null){%>
            <%if(click == true){%>
                <h1><%=meses[nMes-1]%>  <%=nAno%></h1>
                <table border="2">
                    <tr>
                        <%for(String i : diasDaSemana){%>
                            <th><%=i%></th>
                        <%}%>
                    </tr>
                    <tr>
                        <%for(int i = 0; i < d; i++){%>
                            <td></td>
                        <%}%>
                        <%for (int i = 1; i <= days[nMes]; i++){%>
                            <td><%=i%></td>
                            <%if (((i + d) % 7 == 0) || (i == days[nMes])){%>
                                </tr><tr>
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
