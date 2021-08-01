<%-- 
    Document   : Register
    Created on : 23-May-2021, 14:31:31
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/regis.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="content">
                <jsp:include page="Header.jsp"></jsp:include>
                    <h3>Registration Form</h3>
                    <form action="Register" method="post">
                        <table border="0">
                            <!--            <thead>
                                            <tr>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>-->
                            <tbody>
                                <tr>
                                    <td>User Name</td>
                                    <td><input type="text" name="userName" value="${userName}" required/></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td><input type="password" name="password" value="${password}" required/></td>
                                </tr>
                                <tr>
                                    <td>User Type</td>
                                    <td><select name="type">
                                            <option>Teacher</option>
                                            <option>Student</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="text" name="email" value="${email}" required/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><button type="submit" value="Register" >Register</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <h4>${result}</h4>
            </div>
        </div>
    </body>
</html>
