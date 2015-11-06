using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using Sitecore.Layouts;

namespace Spot
{
  public class SpotPresenter : System.Web.UI.UserControl
  {
    public string SpotFieldName { get; set; }

    protected override void Render(HtmlTextWriter writer)
    {
      base.Render(writer);
      //Call a method which will render the spots
      RenderSpots(writer);
    }

    private void RenderSpots(HtmlTextWriter writer)
    {
      //Get the current item from Sitecore
      Item currentItem = Sitecore.Context.Item;
      if (currentItem == null)
        throw new InvalidOperationException("Context item doesn't exist. Is the presentation run outside of a Sitecore context?");

      //Get the spotField to render
      MultilistField spotField = currentItem.Fields[SpotFieldName];
      if (spotField == null)
        throw new InvalidOperationException("Cannot find any spotfield with the name " + SpotFieldName ?? "null");

      IEnumerable<Item> spotItems = spotField.TargetIDs.Select(id => Sitecore.Context.Database.GetItem(id));

      //Iterate over each spot and call a method to render it
      foreach (Item spotItem in spotItems)
        RenderSpot(spotItem, writer);

    }

    private void RenderSpot(Item spotItem, HtmlTextWriter writer)
    {
      //Get the current Device
      DeviceItem device = Sitecore.Context.Device;
      if (device == null)
        throw new InvalidOperationException("Cannot find the context device. Is the presentation run outside of a Sitecore context?");

      //Get the selected renderings on the spot item
      RenderingReference[] renderings = spotItem.Visualization.GetRenderings(device, false);

      foreach (RenderingReference reference in renderings)
      {
        Control control = reference.GetControl();
        //Set the datasource for the presentation
        ((Sitecore.Web.UI.WebControl)control).DataSource = spotItem.Paths.FullPath;
        //use the Sitecore API to render out the contents of the presentation
        control.RenderControl(writer);
      }
    }
  }
}