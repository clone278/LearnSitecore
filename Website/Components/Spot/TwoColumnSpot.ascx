<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TwoColumnSpot.ascx.cs" Inherits="Spot.TwoColumnSpot" %>
<%@ Register TagPrefix="spot" Namespace="Spot" Assembly="Spot" %>

<div class="TwoColumn">
  <div class="LeftColumn">
    <spot:SpotPresenter runat="server" ID="LeftColumnSpots" SpotFieldName="Spot_LeftSideSpots" />
  </div>
  <div class="RightColumn">
    <spot:SpotPresenter runat="server" ID="RightColumnSpots" SpotFieldName="Spot_RightSideSpots" />
  </div>
</div>