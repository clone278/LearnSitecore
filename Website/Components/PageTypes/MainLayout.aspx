<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainLayout.aspx.cs" Inherits="PageTypes.MainLayout" %>
<%@ Register TagPrefix="sc" Assembly="Sitecore.Kernel" Namespace="Sitecore.Web.UI.WebControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="/components/design/css/default.css" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="Page">
        <div class="HeaderRegion">[Header]
          <sc:placeholder runat="server" id="HeaderRegionPlaceholder" key="HeaderRegion" />
        </div>
        <div class="ContentRegion">[Content]
          <sc:placeholder runat="server" id="ContentRegionPlaceholder" key="ContentRegion" />
        </div>    
        <div class="FooterRegion">[Footer]
          <sc:placeholder runat="server" id="FooterRegionPlaceholder" key="FooterRegion" />
        </div>
      </div>
    </form>
</body>
</html>
