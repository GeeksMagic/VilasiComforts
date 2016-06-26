Public Class customerdetails

    Dim _custId As String
    Dim _custName As String
    Dim _email As String
    Dim _mobile As String
    Dim _city As String
    Dim _address As String
    Dim _zip As String
    Dim _spclRequest As String
    Dim _adults As String
    Dim _children As String
    Dim _noOfRooms As String
    Dim _amount As String
    Dim _bookingId As String
    Dim _roomId As String
    Dim _checkIn As String
    Dim _checkOut As String
    Dim _custEmail As String
    Dim _childrens As String

    Sub New(custId As String, custName As String, custEmail As String, _
            mobile As String, city As String, address As String, _
            zip As String, spclRequest As String, adults As String, _
            childrens As String, noOfRooms As String, amount As String, _
            bookingId As String, roomId As String, checkIn As String, _
            checkOut As String)
        Me._custId = custId
        Me._custName = custName
        Me._custEmail = custEmail
        Me._mobile = mobile
        Me._city = city
        Me._address = address
        Me._zip = zip
        Me._spclRequest = spclRequest
        Me._adults = adults
        Me._childrens = childrens
        Me._noOfRooms = noOfRooms
        Me._amount = amount
        Me._bookingId = bookingId
        Me._roomId = roomId
        Me._checkOut = checkOut
        Me._checkIn = checkOut
    End Sub

    Sub New(bookingId As String, custId As String, roomId As String, checkInDate As String, checkOutDate As String, custName As String, paidAmount As String)
        Me._bookingId = bookingId
        Me._custId = custId
        Me._roomId = roomId
        Me._checkIn = checkInDate
        Me._checkOut = checkOutDate
        Me._custName = custName
        Me._amount = paidAmount
    End Sub


    Public ReadOnly Property CustId As String
        Get
            Return _custId
        End Get
    End Property

    Public ReadOnly Property CustName As String
        Get
            Return _custName
        End Get
    End Property

    Public ReadOnly Property Email As String
        Get
            Return _email
        End Get
    End Property

    Public ReadOnly Property Mobile As String
        Get
            Return _mobile
        End Get
    End Property

    Public ReadOnly Property City As String
        Get
            Return _city
        End Get
    End Property

    Public ReadOnly Property Address As String
        Get
            Return _address
        End Get
    End Property

    Public ReadOnly Property Zip As String
        Get
            Return _zip
        End Get
    End Property

    Public ReadOnly Property SpclRequest As String
        Get
            Return _spclRequest
        End Get
    End Property

    Public ReadOnly Property Adults As String
        Get
            Return _adults
        End Get
    End Property

    Public ReadOnly Property Chidren As String
        Get
            Return _children
        End Get
    End Property

    Public ReadOnly Property NoOfRooms As String
        Get
            Return _noOfRooms
        End Get
    End Property

    Public ReadOnly Property Amount As String
        Get
            Return _amount
        End Get
    End Property

    Public ReadOnly Property BookingId As String
        Get
            Return _bookingId
        End Get
    End Property

    Public ReadOnly Property RoomId As String
        Get
            Return _roomId
        End Get
    End Property

    Public ReadOnly Property CheckIn As String
        Get
            Return _checkIn
        End Get
    End Property

    Public ReadOnly Property CheckOut As String
        Get
            Return _checkOut
        End Get
    End Property

End Class
