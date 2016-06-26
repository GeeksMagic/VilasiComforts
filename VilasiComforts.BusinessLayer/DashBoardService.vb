Imports VilasiComforts.DataAccessLayer

Public Class DashBoardService

    Dim objDashBoard As New DashBoardDAL

    Public Function getRoomList() As DataSet
        Return objDashBoard.getContactList()
    End Function

    Public Function getRoomCount() As DataTable
        Return objDashBoard.getRoomCount()
    End Function

    Public Function getRoomNumber() As DataTable
        Return objDashBoard.getRoomNumber()
    End Function

    Function getGuestCount() As DataTable
        Return objDashBoard.getGuestCount()
    End Function

    Public Function getCustomer(ByVal customerId As String, ByVal checkinDate As DateTime, ByVal roomNo As Integer) As DataTable
        Return objDashBoard.getCustomer(customerId, checkinDate, roomNo)
    End Function

    Public Function updatePrice(ByVal price As String, ByVal type As String)
        Return objDashBoard.updateRoomPrice(price, type)
    End Function

    Function BlockRoom(checkInDate As String, roomType As String, block As String) As Boolean
        Return objDashBoard.BlockRoom(checkInDate, roomType, block)
    End Function

End Class
