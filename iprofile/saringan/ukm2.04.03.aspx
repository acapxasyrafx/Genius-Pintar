﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/saringan/ukm2.main.Master"
    CodeBehind="ukm2.04.03.aspx.vb" Inherits="permatapintar.ukm2_04_03" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">
        function Img_Onclick(strImg) {
            //img 1
            if (strImg == "1") {
                if (aspnetForm.ctl00$ContentPlaceHolder1$st01.value == "1") {
                    aspnetForm.ctl00$ContentPlaceHolder1$st01.value = "0"
                    aspnetForm.img01.className = "imgNormal";
                }
                else {
                    aspnetForm.ctl00$ContentPlaceHolder1$st01.value = "1"
                    aspnetForm.img01.className = "imgSelect";
                }
            }
            //img 2
            if (strImg == "2") {
                if (aspnetForm.ctl00$ContentPlaceHolder1$st02.value == "1") {
                    aspnetForm.ctl00$ContentPlaceHolder1$st02.value = "0"
                    aspnetForm.img02.className = "imgNormal";
                }
                else {
                    aspnetForm.ctl00$ContentPlaceHolder1$st02.value = "1"
                    aspnetForm.img02.className = "imgSelect";
                }
            }
            //img 3
            if (strImg == "3") {
                if (aspnetForm.ctl00$ContentPlaceHolder1$st03.value == "1") {
                    aspnetForm.ctl00$ContentPlaceHolder1$st03.value = "0"
                    aspnetForm.img03.className = "imgNormal";
                }
                else {
                    aspnetForm.ctl00$ContentPlaceHolder1$st03.value = "1"
                    aspnetForm.img03.className = "imgSelect";
                }
            }
            //img 4
            if (strImg == "4") {
                if (aspnetForm.ctl00$ContentPlaceHolder1$st04.value == "1") {
                    aspnetForm.ctl00$ContentPlaceHolder1$st04.value = "0"
                    aspnetForm.img04.className = "imgNormal";
                }
                else {
                    aspnetForm.ctl00$ContentPlaceHolder1$st04.value = "1"
                    aspnetForm.img04.className = "imgSelect";
                }
            }

        }
    </script>


    <input id="st01" name="st01" type="hidden" value="0" runat="server" />
    <input id="st02" name="st02" type="hidden" value="0" runat="server" />
    <input id="st03" name="st03" type="hidden" value="0" runat="server" />
    <input id="st04" name="st04" type="hidden" value="0" runat="server" />
    <%--<a href="#">
        <img src="images/logo.png" title="Araken I-PROFILE" alt="Araken I-PROFILE" width="400"
            height="35" border="0" class="logo" /></a>--%>
    <h1>Araken I-PROFILE</h1>

    <h2>
        <asp:Label ID="ukm2_0400_header" runat="server" Text=""></asp:Label>
        [03/28]</h2>
    <asp:Label ID="lbl04_instruction" runat="server" Text="Lihat gambar-gambar berikut. <b>Sila klik atau pilih satu gambar dari setiap baris</b> yang mewakili kategori yang sama."></asp:Label>
    <table class="mytablemain">
        <tr>
            <td class="mytablemain_td">
                <img src="images/04.03.01.jpg" alt="cangkul" class="imgNormal" id="img01" name="img01" onclick='Javascript:Img_Onclick("1");' />
            </td>
            <td class="mytablemain_td">
                <img src="images/04.03.02.jpg" alt="butang" class="imgNormal" id="img02" name="img02" onclick='Javascript:Img_Onclick("2");' />
            </td>
        </tr>
        <tr>
            <td class="mytablemain_td">
                <img src="images/04.03.03.jpg" alt="penyodok" class="imgNormal" id="img03" name="img03" onclick='Javascript:Img_Onclick("3");' />
            </td>
            <td class="mytablemain_td">
                <img src="images/04.03.04.jpg" alt="cermin mata" class="imgNormal" id="img04" name="img04" onclick='Javascript:Img_Onclick("4");' />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnLangkau" runat="server" Text="Langkau Modul" CssClass="mybutton" /><img src="images/white-space.png" width="400px" alt="" />
                <asp:Button ID="btnNext" runat="server" Text="Seterusnya >>" CssClass="mybutton" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLoadStart" runat="server" Text="0"></asp:Label>

</asp:Content>