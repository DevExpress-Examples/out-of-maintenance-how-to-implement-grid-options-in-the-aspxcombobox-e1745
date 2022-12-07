Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub cb_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim combo As ASPxComboBox = TryCast(sender, ASPxComboBox)
		Dim container As GridViewDataItemTemplateContainer = TryCast(combo.NamingContainer, GridViewDataItemTemplateContainer)

		combo.ClientSideEvents.ValueChanged = String.Format("function (s, e) {{ OnValueChanged(s, e, {0}); }}", container.VisibleIndex)
	End Sub
End Class
