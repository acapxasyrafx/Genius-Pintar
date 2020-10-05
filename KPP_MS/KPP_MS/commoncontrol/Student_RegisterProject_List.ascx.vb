﻿Imports System.Data.SqlClient

Public Class Student_RegisterProject_List
    Inherits System.Web.UI.UserControl

    Dim oCommon As New Commonfunction
    Dim strSQL As String
    Dim strRet As String

    '' connection to kolejadmin database
    Dim strConn As String = ConfigurationManager.AppSettings("ConnectionString")
    Dim objConn As SqlConnection = New SqlConnection(strConn)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then

                year_list_info()

                load_page()

                group_list_info()

                strRet = BindData(datRespondent)

            End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub year_list_info()
        strSQL = "SELECT Parameter FROM setting WHERE Type  = 'Year' "
        Dim strConn As String = ConfigurationManager.AppSettings("ConnectionString")
        Dim objConn As SqlConnection = New SqlConnection(strConn)
        Dim sqlDA As New SqlDataAdapter(strSQL, objConn)

        Try
            Dim ds As DataSet = New DataSet
            sqlDA.Fill(ds, "AnyTable")

            ddl_year.DataSource = ds
            ddl_year.DataTextField = "Parameter"
            ddl_year.DataValueField = "Parameter"
            ddl_year.DataBind()

        Catch ex As Exception

        Finally
            objConn.Dispose()
        End Try
    End Sub

    Private Sub group_list_info()
        strSQL = "SELECT distinct ri_groupname from research_info where ri_year = '" & ddl_year.SelectedValue & "'"
        Dim strConn As String = ConfigurationManager.AppSettings("ConnectionString")
        Dim objConn As SqlConnection = New SqlConnection(strConn)
        Dim sqlDA As New SqlDataAdapter(strSQL, objConn)

        Try
            Dim ds As DataSet = New DataSet
            sqlDA.Fill(ds, "AnyTable")

            ddl_group.DataSource = ds
            ddl_group.DataTextField = "ri_groupname"
            ddl_group.DataValueField = "ri_groupname"
            ddl_group.DataBind()
            ddl_group.Items.Insert(0, New ListItem("Select Group", String.Empty))
            ddl_group.SelectedIndex = 0

        Catch ex As Exception

        Finally
            objConn.Dispose()
        End Try
    End Sub

    Private Sub load_page()
        strSQL = "SELECT * from setting where Type = 'Year' and Parameter ='" & Now.Year & "'"

        Dim strConn As String = ConfigurationManager.AppSettings("ConnectionString")
        Dim objConn As SqlConnection = New SqlConnection(strConn)
        Dim sqlDA As New SqlDataAdapter(strSQL, objConn)

        Dim ds As DataSet = New DataSet
        sqlDA.Fill(ds, "AnyTable")

        Dim nRows As Integer = 0
        Dim nCount As Integer = 1
        Dim MyTable As DataTable = New DataTable
        MyTable = ds.Tables(0)
        If MyTable.Rows.Count > 0 Then
            If Not IsDBNull(ds.Tables(0).Rows(0).Item("Parameter")) Then
                ddl_year.SelectedValue = ds.Tables(0).Rows(0).Item("Parameter")
            Else
                ddl_year.SelectedValue = Now.Year
            End If
        End If
    End Sub

    Protected Sub ddl_year_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_year.SelectedIndexChanged
        Try
            group_list_info()
            strRet = BindData(datRespondent)
        Catch ex As Exception
        End Try
    End Sub

    Private Function BindData(ByVal gvTable As GridView) As Boolean
        Dim myDataSet As New DataSet
        Dim myDataAdapter As New SqlDataAdapter(getSQL, strConn)
        myDataAdapter.SelectCommand.CommandTimeout = 120
        Try
            myDataAdapter.Fill(myDataSet, "myaccount")

            gvTable.DataSource = myDataSet
            gvTable.DataBind()
            objConn.Close()

        Catch ex As Exception

            Return False
        End Try
        Return True
    End Function

    Private Function getSQL() As String
        Dim tmpSQL As String
        Dim strWhere As String = ""
        Dim strOrderby As String = "  order by research_info.ri_groupname, student_info.student_Name ASC"

        tmpSQL = "  select research_info.ri_id, research_info.ri_year, student_info.student_name, research_info.ri_groupname, research_info.ri_researchname, 
                    research_info.ri_researchfiled, research_info.ri_researchcompetition
                    from research_info
                    left join student_info on research_info.std_id = student_info.std_ID"

        strWhere = " where student_info.student_Status = 'Access' and research_info.ri_year = '" & ddl_year.SelectedValue & "'"

        If ddl_group.SelectedIndex > 0 Then
            strWhere += " and research_info.ri_groupname = '" & ddl_group.SelectedValue & "'"
        End If

        If txtStudent.Text.Length > 0 Then
            strWhere += " And (student_info.student_ID Like '%" & txtStudent.Text & "%'"
            strWhere += " or student_info.student_Name LIKE '%" & txtStudent.Text & "%'"
            strWhere += " or student_info.student_Mykad LIKE '%" & txtStudent.Text & "%')"
        End If

        getSQL = tmpSQL & strWhere & strOrderby
        ''--debug

        Return getSQL
    End Function

    Protected Sub ddl_group_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_group.SelectedIndexChanged
        Try
            strRet = BindData(datRespondent)
        Catch ex As Exception
        End Try
    End Sub

    Private Sub btnSearch_ServerClick(sender As Object, e As EventArgs) Handles btnSearch.ServerClick
        Try
            strRet = BindData(datRespondent)
        Catch ex As Exception
        End Try
    End Sub

    Private Sub btnBack_ServerClick(sender As Object, e As EventArgs) Handles btnBack.ServerClick
        Response.Redirect("admin_login_berjaya.aspx?admin_ID=" + Request.QueryString("admin_ID"))
    End Sub

    Private Sub btnAdd_ServerClick(sender As Object, e As EventArgs) Handles btnAdd.ServerClick

        For i As Integer = 0 To datRespondent.Rows.Count - 1

            Dim ri_researchname As TextBox = DirectCast(datRespondent.Rows(i).FindControl("ri_researchname"), TextBox)
            Dim ri_researchfiled As TextBox = DirectCast(datRespondent.Rows(i).FindControl("ri_researchfiled"), TextBox)
            Dim ri_researchcompetition As TextBox = DirectCast(datRespondent.Rows(i).FindControl("ri_researchcompetition"), TextBox)
            Dim strKeyID As String = datRespondent.DataKeys(i).Value.ToString

            If ri_researchname.Text.Length > 0 Or ri_researchfiled.Text.Length > 0 Or ri_researchcompetition.Text.Length > 0 Then

                Dim researchname As String = oCommon.FixSingleQuotes(ri_researchname.Text)
                Dim researchfiled As String = oCommon.FixSingleQuotes(ri_researchfiled.Text)
                Dim researchcompetition As String = oCommon.FixSingleQuotes(ri_researchcompetition.Text)

                ''update grades and gpa
                strSQL = "UPDATE research_info set ri_researchname = '" & researchname.ToUpper & "', ri_researchfiled = '" & researchfiled.ToUpper & "', ri_researchcompetition = '" & researchcompetition.ToUpper & "' where ri_id = '" & strKeyID & "'"
                strRet = oCommon.ExecuteSQL(strSQL)

            End If
        Next

        If strRet = "0" Then
            ShowMessage("Register student project", MessageType.Success)
        Else
            ShowMessage("Register student project", MessageType.Error)
        End If

        strRet = BindData(datRespondent)

    End Sub

    Protected Sub ShowMessage(Message As String, type As MessageType)
        ScriptManager.RegisterStartupScript(Me, Me.[GetType](), System.Guid.NewGuid().ToString(), "ShowMessage('" & Message & "','" & type.ToString() & "');", True)
    End Sub

    Public Enum MessageType
        Success
        [Error]
    End Enum
End Class