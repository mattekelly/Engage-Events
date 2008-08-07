// <copyright file="TemplateDisplayOptions.ascx.cs" company="Engage Software">
// Engage: Events - http://www.engagemodules.com
// Copyright (c) 2004-2008
// by Engage Software ( http://www.engagesoftware.com )
// </copyright>
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.

namespace Engage.Dnn.Events.Display
{
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Web.UI.WebControls;
    using DotNetNuke.Entities.Modules;
    using DotNetNuke.Services.Exceptions;
    using Framework.Templating;
    using Engage.Events;
    using Framework;
    using Templating;
    using Setting = Setting;
    using Utility = Utility;

    /// <summary>
    /// The settings for a template
    /// </summary>
    public partial class TemplateDisplayOptions : ModuleSettingsBase
    {
        internal string DisplayModeOption
        {
            set
            {
                ModuleController modules = new ModuleController();
                modules.UpdateTabModuleSetting(this.TabModuleId, Setting.DisplayModeOption.PropertyName, value.ToString(CultureInfo.InvariantCulture));
            }

            get
            {
                return Utility.GetStringSetting(this.Settings, Setting.DisplayModeOption.PropertyName, string.Empty);
            }
        }

        internal string HeaderTemplate
        {
            set
            {
                ModuleController modules = new ModuleController();
                modules.UpdateTabModuleSetting(this.TabModuleId, Framework.Setting.HeaderTemplate.PropertyName, value.ToString(CultureInfo.InvariantCulture));
            }

            get
            {
                return Utility.GetStringSetting(this.Settings, Framework.Setting.HeaderTemplate.PropertyName, string.Empty);
            }
        }

        internal string ItemTemplate
        {
            set
            {
                ModuleController modules = new ModuleController();
                modules.UpdateTabModuleSetting(this.TabModuleId, Framework.Setting.ItemTemplate.PropertyName, value.ToString(CultureInfo.InvariantCulture));
            }

            get
            {
                return Utility.GetStringSetting(this.Settings, Framework.Setting.ItemTemplate.PropertyName, string.Empty);
            }
        }

        internal string FooterTemplate
        {
            set
            {
                ModuleController modules = new ModuleController();
                modules.UpdateTabModuleSetting(this.TabModuleId, Framework.Setting.FooterTemplate.PropertyName, value.ToString(CultureInfo.InvariantCulture));
            }

            get
            {
                return Utility.GetStringSetting(this.Settings, Framework.Setting.FooterTemplate.PropertyName, string.Empty);
            }
        }

        internal string DetailTemplate
        {
            set
            {
                ModuleController modules = new ModuleController();
                modules.UpdateTabModuleSetting(this.TabModuleId, Framework.Setting.DetailTemplate.PropertyName, value.ToString(CultureInfo.InvariantCulture));
            }

            get
            {
                return Utility.GetStringSetting(this.Settings, Framework.Setting.DetailTemplate.PropertyName, string.Empty);
            }
        }

        internal int RecordsPerPage
        {
            set
            {
                ModuleController modules = new ModuleController();
                modules.UpdateTabModuleSetting(this.TabModuleId, Framework.Setting.RecordsPerPage.PropertyName, value.ToString(CultureInfo.InvariantCulture));
            }

            get
            {
                return Utility.GetIntSetting(this.Settings, Framework.Setting.RecordsPerPage.PropertyName, 0);
            }
        }

        /// <summary>
        /// Loads the possible settings, and selects the current values.
        /// </summary>
        public override void LoadSettings()
        {
            try
            {
                this.DisplayModeDropDown.Items.Add(new ListItem(ListingMode.All.ToString()));
                this.DisplayModeDropDown.Items.Add(new ListItem(ListingMode.Past.ToString()));
                this.DisplayModeDropDown.Items.Add(new ListItem(ListingMode.CurrentMonth.ToString()));
                this.DisplayModeDropDown.Items.Add(new ListItem(ListingMode.Future.ToString()));

                ListItem li = this.DisplayModeDropDown.Items.FindByValue(this.DisplayModeOption);
                if (li != null)
                {
                    li.Selected = true;
                }

                List<Template> templates = TemplateEngine.GetHeaderTemplates(ModuleBase.PhysicialTemplatesFolderName);
                this.HeaderDropdownlist.DataTextField = "DocumentName";
                this.HeaderDropdownlist.DataValueField = "DocumentName";
                this.HeaderDropdownlist.DataSource = templates;
                this.HeaderDropdownlist.DataBind();

                li = this.HeaderDropdownlist.Items.FindByValue(this.HeaderTemplate);
                if (li != null)
                {
                    li.Selected = true;
                }

                templates = TemplateEngine.GetItemTemplates(ModuleBase.PhysicialTemplatesFolderName);
                this.ItemDropdownlist.DataTextField = "DocumentName";
                this.ItemDropdownlist.DataValueField = "DocumentName";
                this.ItemDropdownlist.DataSource = templates;
                this.ItemDropdownlist.DataBind();

                li = this.ItemDropdownlist.Items.FindByValue(this.ItemTemplate);
                if (li != null)
                {
                    li.Selected = true;
                }

                templates = TemplateEngine.GetFooterTemplates(ModuleBase.PhysicialTemplatesFolderName);
                this.FooterDropdownlist.DataTextField = "DocumentName";
                this.FooterDropdownlist.DataValueField = "DocumentName";
                this.FooterDropdownlist.DataSource = templates;
                this.FooterDropdownlist.DataBind();

                li = this.FooterDropdownlist.Items.FindByValue(this.FooterTemplate);
                if (li != null)
                {
                    li.Selected = true;
                }

                templates = TemplateEngine.GetDetailTemplates(ModuleBase.PhysicialTemplatesFolderName);
                this.DetailDropdownlist.DataTextField = "DocumentName";
                this.DetailDropdownlist.DataValueField = "DocumentName";
                this.DetailDropdownlist.DataSource = templates;
                this.DetailDropdownlist.DataBind();

                li = this.DetailDropdownlist.Items.FindByValue(this.DetailTemplate);
                if (li != null)
                {
                    li.Selected = true;
                }

                string recordPerPage = Utility.GetStringSetting(this.Settings, Framework.Setting.RecordsPerPage.PropertyName);
                if (recordPerPage != null)
                {
                    this.RadNumericRecordsPerPage.Value = Convert.ToDouble(this.RecordsPerPage);
                }
            }
            catch (Exception exc)
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// <summary>
        /// Updates the settings for this module.
        /// </summary>
        public override void UpdateSettings()
        {
            base.UpdateSettings();

            if (this.Page.IsValid)
            {
                this.DisplayModeOption = this.DisplayModeDropDown.SelectedValue;
                this.HeaderTemplate = this.HeaderDropdownlist.SelectedValue;
                this.ItemTemplate = this.ItemDropdownlist.SelectedValue;
                this.FooterTemplate = this.FooterDropdownlist.SelectedValue;
                this.DetailTemplate = this.DetailDropdownlist.SelectedValue;
                this.RecordsPerPage = Convert.ToInt32(this.RadNumericRecordsPerPage.Value);
            }
        }
    }
}