﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="student.studentuni.update.aspx.vb" Inherits="permatapintar.student_studentuni_update" %>

<%@ Register Src="commoncontrol/studentprofile_header.ascx" TagName="studentprofile_header"
    TagPrefix="uc1" %>
<%@ Register Src="commoncontrol/studentuni_update.ascx" TagName="studentuni_update" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:studentprofile_header ID="studentprofile_header1" runat="server" />
    &nbsp;<uc2:studentuni_update ID="studentuni_update1" runat="server" />
</asp:Content>