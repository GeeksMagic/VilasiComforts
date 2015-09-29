﻿Imports MySql.Data.MySqlClient
Imports System.Data.SqlClient

Public Class DashBoardDAL

    Dim constr As String = ConfigurationManager.ConnectionStrings("VilasiComforts").ConnectionString
    'Dim con As New MySqlConnection(constr)
    Dim con As SqlConnection = New SqlConnection(constr)
    'Dim cmd As New MySqlCommand

    Function getContactList() As DataSet
        'Dim cmd As New MySqlCommand("select distinct(Room_Type),rent from Rooms;", con)
        ''cmd.CommandText = "select * from Rooms"
        ''cmd.Connection = con
        'Dim myAdapter As MySqlDataAdapter = New MySqlDataAdapter()
        'Dim ds As New DataSet
        ''
        ''cmd.CommandType = CommandType.Text
        'con.Open()
        'myAdapter.SelectCommand = cmd
        'myAdapter.Fill(ds, "Rooms")
        'con.Close()
        'Return ds

        Dim cmd As New SqlCommand("select CONTACT_ID,CONTACT_NAME,CONTACT_EMAIL,CONTACT_MOBILE,CONTACT_MESSAGE from Contacts;", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        con.Open()
        da.Fill(ds, "Contacts")
        cmd.Dispose()
        con.Close()
        Return ds
    End Function

    Function getRoomCount() As DataTable
        Dim cmd As New SqlCommand("select (select count(*) from rooms where rent='3000') as Suit,(select count(*) from rooms where rent='1990') as 'AC-Double',(select count(*) from rooms where rent='1250') as 'Non-AC-Double',(select count(*) from rooms where rent='900') as 'Non-AC_Single';", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim roomCount As DataTable = New DataTable()
        con.Open()
        da.Fill(roomCount)
        cmd.Dispose()
        con.Close()
        Return roomCount
    End Function

    Function getRoomNumber() As DataTable
        Dim cmd As New SqlCommand("select roomId as RoomNumber from rooms;", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim roomNumber As DataTable = New DataTable()
        con.Open()
        da.Fill(roomNumber)
        cmd.Dispose()
        con.Close()
        Return roomNumber
    End Function

    Function getCustomer(ByVal customerId As String, ByVal checkinDate As DateTime, ByVal roomNo As Integer) As DataTable
        Dim cmd As New SqlCommand()
        If customerId = "" AndAlso checkinDate = "1900/01/01" AndAlso roomNo = "0" Then
            cmd = New SqlCommand("select a.Customer_Id, a.Full_Name, b.Room_Id, b.Checkin_Date, b.CheckOut_Date, a.Phone, a.EMail  from Customers a left outer join Bookings b on a.Customer_Id=b.Customer_Id;", con)
        ElseIf customerId <> "" AndAlso checkinDate = "1900/01/01" AndAlso roomNo = "0" Then
            cmd = New SqlCommand("select a.Customer_Id, a.Full_Name, b.Room_Id, b.Checkin_Date, b.CheckOut_Date, a.Phone, a.EMail  from Customers a left outer join Bookings b on a.Customer_Id=b.Customer_Id where a.Customer_Id='" & customerId & "';", con)
        ElseIf customerId = "" AndAlso checkinDate <> "1900/01/01" AndAlso roomNo = "0" Then
            cmd = New SqlCommand("select a.Customer_Id, a.Full_Name, b.Room_Id, b.Checkin_Date, b.CheckOut_Date, a.Phone, a.EMail  from Customers a left outer join Bookings b on a.Customer_Id=b.Customer_Id where b.Checkin_Date='" & checkinDate & "';", con)
        ElseIf customerId = "" AndAlso checkinDate = "1900/01/01" AndAlso roomNo <> "0" Then
            cmd = New SqlCommand("select a.Customer_Id, a.Full_Name, b.Room_Id, b.Checkin_Date, b.CheckOut_Date, a.Phone, a.EMail  from Customers a left outer join Bookings b on a.Customer_Id=b.Customer_Id where b.Room_Id='" & roomNo & "';", con)
        ElseIf customerId <> "" AndAlso checkinDate <> "1900/01/01" AndAlso roomNo = "0" Then
            cmd = New SqlCommand("select a.Customer_Id, a.Full_Name, b.Room_Id, b.Checkin_Date, b.CheckOut_Date, a.Phone, a.EMail  from Customers a left outer join Bookings b on a.Customer_Id=b.Customer_Id where a.Customer_Id='" & customerId & "' and b.CheckIn_Date='" & checkinDate & "';", con)
        ElseIf customerId <> "" AndAlso checkinDate = "1900/01/01" AndAlso roomNo <> "0" Then
            cmd = New SqlCommand("select a.Customer_Id, a.Full_Name, b.Room_Id, b.Checkin_Date, b.CheckOut_Date, a.Phone, a.EMail  from Customers a left outer join Bookings b on a.Customer_Id=b.Customer_Id where a.Customer_Id='" & customerId & "' and b.Room_Id='" & roomNo & "';", con)
        ElseIf customerId = "" AndAlso checkinDate <> "1900/01/01" AndAlso roomNo <> "0" Then
            cmd = New SqlCommand("select a.Customer_Id, a.Full_Name, b.Room_Id, b.Checkin_Date, b.CheckOut_Date, a.Phone, a.EMail  from Customers a left outer join Bookings b on a.Customer_Id=b.Customer_Id where b.CheckIn_Date='" & checkinDate & "' and b.Room_Id='" & roomNo & "';", con)
        Else
            cmd = New SqlCommand("select a.Customer_Id, a.Full_Name, b.Room_Id, b.Checkin_Date, b.CheckOut_Date, a.Phone, a.EMail  from Customers a left outer join Bookings b on a.Customer_Id=b.Customer_Id where a.Customer_Id='" & customerId & "' and b.CheckIn_Date='" & checkinDate & "' and b.Room_Id='" & roomNo & "';", con)
        End If
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim cutomer As DataTable = New DataTable()
        con.Open()
        da.Fill(cutomer)
        cmd.Dispose()
        con.Close()
        Return cutomer
    End Function

    Function getGuestCount() As DataTable
        Dim cmd As New SqlCommand("select (select count(*) from Bookings) as TotalGuest, (select count(*) from Bookings where MONTH(CheckIn_Date)= MONTH(GETDATE())) as MonthGuest, (select count(*) from Bookings where DAY(CheckIn_Date)= DAY(GETDATE())) as TodayGuest;", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim guestCount As DataTable = New DataTable()
        con.Open()
        da.Fill(guestCount)
        cmd.Dispose()
        con.Close()
        Return guestCount
    End Function

End Class