Imports VilasiComforts.DataAccessLayer

Public Class AllotRoomService

    Dim objAllotRoom As New AllotRoomDAL

    Public Function getCustomerDetails(ByVal bookingId As String) As DataTable
        Return objAllotRoom.getCustomerDetails(bookingId)
    End Function

End Class
