Imports MySql.Data.MySqlClient
Imports System.Data.SqlClient
Imports VilasiComforts.Model

Public Class BookRoomDAL

    Dim constr As String = ConfigurationManager.ConnectionStrings("VilasiComforts").ConnectionString
    'Dim con As New MySqlConnection(constr)
    Dim con As SqlConnection = New SqlConnection(constr)
    'Dim cmd As New MySqlCommand

    Function getRoomList() As DataSet
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

        Dim cmd As New SqlCommand("select distinct(RoomType),rent from Rooms where RoomType not in ('Extra Bed','Extra Person');", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        con.Open()
        da.Fill(ds, "Rooms")
        cmd.Dispose()
        con.Close()
        Return ds
    End Function

    Public Function BookRoom(ByVal model As customerdetails) As Boolean
        'Dim cmd As New SqlCommand("insert into Contacts(CONTACT_NAME,CONTACT_EMAIL,CONTACT_MOBILE,CONTACT_MESSAGE) values ('" & name & "','" & email & "','" & phone & "','" & msg & "');", con)
        Dim cmd As New SqlCommand
        'Dim cmd As New SqlCommand("insert into VilasiComforts.Customers(CUSTOMER_ID,FULL_NAME,EMAIL,PHONE,CITY,ADDRESS,ZIP,SPECIAL_REQUEST,ADULT_COUNT,CHILD_COUNT,NO_OF_ROOMS)Values('" & CustId & "','" & fullName & "','" & email & "','" & phone & "','" & city & "','" & address & "','" & zip & "','" & spclRequest & "'," & adult & "," & child & "," & numOfRooms & ");insert into Bookings(BOOKING_ID,CUSOMER_ID,ROOMID,CHECKIN_DATE,CHECKOUT_DATE,NET_AMOUNT)SELECT 4,4,VilasiComforts.Rooms.Room_ID,'04-08-2015','06-08-2015',5000 from  VilasiComforts.Rooms  where VilasiComforts.Rooms.Room_Type='AC Double';")
        'If model.CustId = "Owner" Then
        'cmd = New SqlCommand("INSERT INTO [Bookings]  VALUES ('" + model.BookingId + "','" + model.CustId + "'," + model.RoomId + ",'" + model.CheckIn + "','" + model.CheckOut + "'," + model.Amount + ");", con)
        ' Else
        cmd = New SqlCommand("INSERT INTO [Customers] VALUES ('" + model.CustId + "','" + model.CustName + "','" + model.Email + "','" + model.Mobile + "','" + model.City + "','" + model.Address + "','" + model.Zip + "','" + model.SpclRequest + "','" + model.Adults + "','" + model.Chidren + "','" + model.NoOfRooms + "'); INSERT INTO [Bookings]  VALUES ('" + model.BookingId + "','" + model.CustId + "'," + model.RoomId + ",'" + model.CheckIn + "','" + model.CheckOut + "'," + model.Amount + ");", con)
        'End If
        cmd.CommandType = CommandType.Text
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery
        If i > 0 Then
            con.Close()
            Return True
        Else
            con.Close()
            Return False
        End If
    End Function

    Public Function checkRoom(ByVal checkInDate As String, ByVal roomType As String) As DataSet
        Dim cmd As New SqlCommand("Select RoomId from Rooms where RoomType='" + roomType + "' and RoomId NOT IN (Select a.Room_Id from Bookings a left outer join Rooms b on a.Room_Id=b.RoomId where  CONVERT(DATETIME,'" + checkInDate + "') BETWEEN a.CheckIn_Date AND a.CheckOut_Date)", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        con.Open()
        da.Fill(ds, "Rooms")
        cmd.Dispose()
        con.Close()
        Return ds
    End Function

    Public Function getCustId() As Object
        Dim cmd As New SqlCommand("select max(SlNo)+1 as Customer_Id from Customers;", con)
        cmd.CommandType = CommandType.Text
        con.Open()
        Dim custId As Object = cmd.ExecuteScalar()
        cmd.Dispose()
        con.Close()
        Return custId
    End Function

    Public Function getBookingId() As Object
        Dim cmd As New SqlCommand("select max(SlNo)+1 as Booking_Id from Bookings;", con)
        cmd.CommandType = CommandType.Text
        con.Open()
        Dim custId As Object = cmd.ExecuteScalar()
        cmd.Dispose()
        con.Close()
        Return custId
    End Function

    Function getRooms() As DataSet
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

        Dim cmd As New SqlCommand("select distinct(RoomType),rent from Rooms;", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        con.Open()
        da.Fill(ds, "Rooms")
        cmd.Dispose()
        con.Close()
        Return ds
    End Function

    Public Function checkRoomAvailability(ByVal checkIn As String, ByVal roomId As String) As Integer
        Dim cmd As New SqlCommand("select Block from BlockTable where CheckInDate='" & checkIn & "' and RoomId='" & roomId & "'", con)
        cmd.CommandType = CommandType.Text
        con.Open()
        Dim avail As Object = cmd.ExecuteScalar()
        cmd.Dispose()
        con.Close()
        Return avail
    End Function

End Class
