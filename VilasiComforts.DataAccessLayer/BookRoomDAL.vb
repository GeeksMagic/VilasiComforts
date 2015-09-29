Imports MySql.Data.MySqlClient
Imports System.Data.SqlClient

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

    Public Function BookRoom(ByVal CustId As String, ByVal fullName As String, ByVal email As String, ByVal phone As String, ByVal city As String, ByVal address As String, ByVal zip As String, ByVal spclRequest As String, ByVal adult As Integer, ByVal child As Integer, ByVal numOfRooms As Integer) As Boolean
        'Dim cmd As New SqlCommand("insert into Contacts(CONTACT_NAME,CONTACT_EMAIL,CONTACT_MOBILE,CONTACT_MESSAGE) values ('" & name & "','" & email & "','" & phone & "','" & msg & "');", con)

        Dim cmd As New SqlCommand("insert into VilasiComforts.Customers(CUSTOMER_ID,FULL_NAME,EMAIL,PHONE,CITY,ADDRESS,ZIP,SPECIAL_REQUEST,ADULT_COUNT,CHILD_COUNT,NO_OF_ROOMS)Values('" & CustId & "','" & fullName & "','" & email & "','" & phone & "','" & city & "','" & address & "','" & zip & "','" & spclRequest & "'," & adult & "," & child & "," & numOfRooms & ");insert into Bookings(BOOKING_ID,CUSOMER_ID,ROOMID,CHECKIN_DATE,CHECKOUT_DATE,NET_AMOUNT)SELECT 4,4,VilasiComforts.Rooms.Room_ID,'04-08-2015','06-08-2015',5000 from  VilasiComforts.Rooms  where VilasiComforts.Rooms.Room_Type='AC Double';")
        cmd.CommandType = CommandType.Text
        con.Open()
        If cmd.ExecuteNonQuery().Equals(1) Then
            con.Close()
            Return True
        Else
            con.Close()
            Return False
        End If
    End Function

End Class
