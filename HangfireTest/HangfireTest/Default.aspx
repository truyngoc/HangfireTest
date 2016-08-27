<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HangfireTest._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // auto refresh page in 5 second
        //var timeout = setTimeout("location.reload(true);", 5000);

        function checklength(i) {
            'use strict';
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }

        var minutes, seconds, count, counter, timer;
        count = 30; //seconds
        counter = setInterval(timer, 1000);

        function timer() {
            'use strict';
            count = count - 1;
            minutes = checklength(Math.floor(count / 60));
            seconds = checklength(count - minutes * 60);
            if (count < 0) {
                clearInterval(counter);
                return;
            }
            document.getElementById("timer").innerHTML = 'Next refresh in ' + minutes + ':' + seconds + ' ';
            if (count === 0) {
                location.reload();
            }
        }
    </script>


    <div class="row">
        <span id="timer" class="text-danger"></span>
    </div>

    
</asp:Content>
