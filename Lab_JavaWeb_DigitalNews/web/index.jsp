<%-- 
    Document   : index
    Created on : 13-Jun-2021, 10:57:15
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="playground">

            <form>
                <p>Highlight keywords as you type: <input id="keywords" size="24"></p>
            </form>

            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Vivamus felis erat, facilisis vitae est sed, interdum luctus dui. Donec 
                condimentum in neque ac consequat. Donec interdum quis massa molestie 
                consequat. Pellentesque habitant morbi tristique senectus et netus et 
                malesuada fames ac turpis egestas. Vestibulum malesuada quam quis sapien 
                volutpat placerat. Phasellus varius, enim vel fringilla pellentesque, 
                felis velit mollis lacus, ac scelerisque sem sem sed eros.</p>

        </div>

        <script src="hilitor.js"></script>
        <script>

            window.addEventListener("DOMContentLoaded", function (e) {
                var myHilitor2 = new Hilitor("playground");
                myHilitor2.setMatchType("left");
                document.getElementById("keywords").addEventListener("keyup", function (e) {
                    myHilitor2.apply(this.value);
                }, false);
            }, false);

        </script>
    </body>
</html>
