Imports VilasiComforts.DataAccessLayer

Public Class BookRoomService

    Dim objBookRoom As New BookRoomDAL

    Public Function getRoomList() As DataSet
        Return objBookRoom.getRoomList()
    End Function

End Class
