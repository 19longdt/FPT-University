<%-- 
    Document   : HomePage
    Created on : 13-Jun-2021, 11:03:51
    Author     : hp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/mark.min.js" charset="UTF-8"></script>
        <script>

            function check() {
                var a = document.getElementById('txtSearch').value;
                if (a.trim() == "") {
                    alert("Please input Search");
                    return;
                }
                window.location = "search?index=1&txtSearch=" + a;
            }
        </script>
    </head>
    <body>
        <div class="container">

            <div class="preheader">

            </div>
            <div class="header">
                <h3>My Digital News</h3>
            </div>
            <div class="menu">
                <a href="home">News</a>
            </div> 
            <div class="main">
                <c:if test="${txtSearch == null}">
                    <div class="left">
                        <div class="title">
                            ${digital.title}
                        </div>

                        <div class="image">
                            <img class="imgpost" src="images/${digital.image}" alt=""/>
                        </div>
                        <div class="description">
                            ${digital.description}
                        </div>

                        <div class="author">
                            <img src="images/timeicon.gif" alt="" />By ${digital.author} | ${digital.time}
                        </div>
                    </div>
                </c:if>
                <c:if test="${txtSearch != null}">
                    <div class="left">     
                        <h5>${result}</h5>
                        <c:forEach items="${list}" var="o">
                            <div class="title">
                                <a id="highlighttitle" href="ditail?id=${o.ID}">      
                                    ${o.title}
                                </a>
                            </div>
                            <!--<div class="content">--> 
                            <img class="imgpost" src="images/${o.image}" style="width: 30%" alt=""/>

                            <div class="description">
                                ${o.shortDes}
                            </div>
                            <!--</div>-->
                        </c:forEach>
                        <div class="paging">
                            <c:if test="${count > 2}">
                                <c:forEach begin="1" end= "${end}" var="i">
                                    <a ${index == i ? "active" : "" }  href="search?index=${i}&txtSearch=${txtSearch}">${i}</a>
                                </c:forEach>
                            </c:if>

                        </div>
                    </div> 
                    <script>
                        var txt = document.querySelectorAll('#highlighttitle');
                        var instance = new Mark(txt);
                        instance.mark('${txtSearch}');
                    </script>
                </c:if>

                <div class="right">
                    <div class="new">
                        Digital News
                    </div>
                    <div class="shortDes">
                        ${digitalRecent.shortDes}
                    </div>
                    <div class="searchtitle">
                        Search
                    </div>

                    <div class="search">
                        <input class="searchbox" id="txtSearch" type="text" name="txtSearch" value="${txtSearch}" />
                        <input class="btnSearch" type="submit" value="Go" onclick="check()"/>
                    </div>

                    <div class="top5">
                        <div class="titleNews">
                            <span>Last Articles</span><br>
                        </div>
                        <c:forEach items="${listTop5}" var="o">
                            <div class="lista">
                                <a href="ditail?id=${o.ID}">${o.title}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div> 
            <div class="footer">
            </div>

        </div>
    </body>
</html>
