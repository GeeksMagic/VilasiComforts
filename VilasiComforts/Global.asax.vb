Imports System.Web.SessionState
Imports System.Web.Routing

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application is started
        RegisterRoutes(RouteTable.Routes)
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
        Dim fullOrigionalpath As [String] = Request.Url.ToString()
        Dim sElements As [String]() = fullOrigionalpath.Split("/"c)
        Dim sFilePath As [String]() = sElements(sElements.Length - 1).Split("."c)
        Dim queryString As [String]() = sElements(sElements.Length - 1).Split("?"c)

        If Not fullOrigionalpath.Contains(".aspx") AndAlso sFilePath.Length = 1 Then
            If Not String.IsNullOrEmpty(sFilePath(0).Trim()) Then
                If queryString.Length = 1 Then
                    Context.RewritePath(sFilePath(0) + ".aspx")
                Else
                    Context.RewritePath(queryString(0) + ".aspx?" + queryString(1))
                End If

            End If
        End If
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when an error occurs
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
    End Sub

   Private Shared Sub RegisterRoutes(routes As RouteCollection)
        routes.MapPageRoute("Admin", "Admin", "~/Admin.aspx")
        routes.MapPageRoute("About", "About", "~/About.aspx")
        routes.MapPageRoute("BookRoom", "BookRoom", "~/BookRoom.aspx")
        routes.MapPageRoute("Gallery", "Gallery", "~/Gallery.aspx")
        routes.MapPageRoute("Services", "Services", "~/Services.aspx")
        routes.MapPageRoute("ContactUs", "ContactUs", "~/ContactUs.aspx")
    End Sub

End Class