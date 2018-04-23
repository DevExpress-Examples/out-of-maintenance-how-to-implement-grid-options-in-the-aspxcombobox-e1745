<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.2, Version=9.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Universal command combo box</title>

	<script language="javascript" type="text/javascript">
	function OnValueChanged(s, e, index) {
		var value = s.GetValue();
		if (value == null)
			return;

		switch (value)
		{
			case 0:
				grid.AddNewRow();
				break;
			case 1:
				grid.StartEditRow(index);
				break;
			case 2:
				grid.DeleteRow(index);
				break;
			case 3:
				grid.UnselectRows();
				break;
			case 4:
				grid.SelectAllRowsOnPage();
				s.SetValue(null);
				break;
			case 5:
				grid.SelectRows();
				break;            
		}
	}

	</script>

</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dxwgv:ASPxGridView ID="grid" runat="server" DataSourceID="sds" KeyFieldName="ProductID"
				ClientInstanceName="grid" AutoGenerateColumns="False">
				<Columns>
					<dxwgv:GridViewDataTextColumn Caption="#" VisibleIndex="0" Width="100px">
						<EditFormSettings Visible="False" />
						<DataItemTemplate>
							<dxe:ASPxComboBox ID="cb" runat="server" ValueType="System.Int32" Width="100%" SelectedIndex="0"
								OnInit="cb_Init">
								<Items>
									<dxe:ListEditItem Selected="True" Text="--- Select ---" />
									<dxe:ListEditItem Value="0" Text="New" />
									<dxe:ListEditItem Value="1" Text="Edit" />
									<dxe:ListEditItem Value="2" Text="Delete" />
									<dxe:ListEditItem Value="3" Text="Select: None" />
									<dxe:ListEditItem Value="4" Text="Select: Page" />
									<dxe:ListEditItem Value="5" Text="Select: All" />
								</Items>
							</dxe:ASPxComboBox>
						</DataItemTemplate>
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
						<EditFormSettings Visible="False" />
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="3">
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="4">
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="5">
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="6">
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="7">
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="8">
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="9">
					</dxwgv:GridViewDataTextColumn>
					<dxwgv:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="10">
					</dxwgv:GridViewDataCheckColumn>
				</Columns>
			</dxwgv:ASPxGridView>
			<asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
				SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
		</div>
	</form>
</body>
</html>
