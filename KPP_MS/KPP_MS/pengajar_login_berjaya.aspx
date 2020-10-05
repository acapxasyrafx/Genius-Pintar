﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/pengajar.Master" CodeBehind="pengajar_login_berjaya.aspx.vb" Inherits="KPP_MS.pengajar_login_berjaya" %>

<%@ Register Src="~/commoncontrol/lecturer_homepage.ascx" TagPrefix="uc1" TagName="lecturer_homepage" %>
<%@ Register Src="~/commoncontrol/lecturer_coursepage.ascx" TagPrefix="uc1" TagName="lecturer_coursepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function staff_info() {
            if (document.getElementById("pengajar_info").value == 0) {
                document.getElementById("staff_info").style.display = "block";
                document.getElementById("pengajar_info").value = 1;
            }

            else if (document.getElementById("pengajar_info").value == 1) {
                document.getElementById("staff_info").style.display = "none";
                document.getElementById("pengajar_info").value = 0;
            }
        }

        function course_info() {
            if (document.getElementById("kursus_info").value == 0) {
                document.getElementById("course_info").style.display = "block";
                document.getElementById("kursus_info").value = 1;
            }

            else if (document.getElementById("kursus_info").value == 1) {
                document.getElementById("course_info").style.display = "none";
                document.getElementById("kursus_info").value = 0;
            }
        }
    </script>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#uploadPhoto").change(function () {
            readURL(this);
        });
    </script>

    <script type="text/javascript">
        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; text-align:left -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');

            setTimeout(function () {
                $("#alert_div").fadeTo(5000, 500).slideUp(500, function () {
                    $("#alert_div").remove();
                });
            }, 3000);
        }
    </script>

    <uc1:lecturer_homepage runat="server" id="lecturer_homepage" />
    <uc1:lecturer_coursepage runat="server" id="lecturer_coursepage" />

</asp:Content>