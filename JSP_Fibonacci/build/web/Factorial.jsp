<%-- 
    Document   : Factorial
    Created on : 20 Sep, 2022, 2:38:15 PM
    Author     : admin
--%>

<html>
<body>
<%!
   long n, result;
   String str;

   long fact(long n) {
      if(n==0)        
         return 1;   
      else
         return n*fact(n-1);
   }
%>
<%    
    str = request.getParameter("val");    
    n = Long.parseLong(str);   
    result = fact(n);
%>
<b>Factorial value: </b> <%= result %>
</body>
</html>
