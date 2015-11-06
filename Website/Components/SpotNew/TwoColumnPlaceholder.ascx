<%@ Control Language="c#" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="sc" Assembly="Sitecore.Kernel" Namespace="Sitecore.Web.UI.WebControls" %>

<div class="TwoColumn">
  <div class="LeftColumn">
    <sc:placeholder id="LeftPlaceholder" runat="server" key="SpotLeftPlaceholder" />
  </div>
  <div class="RightColumn">
    <sc:placeholder id="RightPlaceholder" runat="server" key="SpotRightPlaceholder" />  
  </div>
</div>