Imports VilasiComforts.DataAccessLayer
Imports VilasiComforts.Model

Public Class BookRoomService

    Dim objBookRoom As New BookRoomDAL

    Public Function getRoomList() As DataSet
        Return objBookRoom.getRoomList()
    End Function

    Public Function checkRoom(ByVal checkInDate As String, ByVal roomType As String, ByVal roomNo As String) As DataSet
        If objBookRoom.checkRoomAvailability(checkInDate, roomNo) Then
            Dim ds As New DataSet
            ds.Tables.Add()
            Return ds
        End If
        Return objBookRoom.checkRoom(checkInDate, roomType)
    End Function

    Public Function getCustId() As Object
        Return objBookRoom.getCustId()
    End Function

    Public Function getBookingId() As Object
        Return objBookRoom.getBookingId()
    End Function

    Public Function bookRoom(model As customerdetails) As Boolean
        Return objBookRoom.BookRoom(model)
    End Function

    Public Function getRooms() As DataSet
        Return objBookRoom.getRooms()
    End Function

End Class
