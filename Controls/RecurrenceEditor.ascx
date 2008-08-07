<%@ Control Language="c#" AutoEventWireup="false" Inherits="Engage.Dnn.Events.Recurrence.RecurrenceEditor" CodeBehind="RecurrenceEditor.ascx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<div class="rsAdvancedEdit rsAdvOptions">
    <asp:Panel ID="RecurrencePatternPanel" runat="server" CssClass="rsAdvRecurrencePatterns">
        <p class="rsAdvRecurrence"><strong><%=Localize("Recurrence")%></strong></p>
        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false"><%-- This UpdatePanel needs to include the RecurrenceFrequencyPanel, so that it can update the RepeatFrequencyHourly to postback if it gets reselected.  See http://www.engagesoftware.com/Blog/EntryID/76.aspx --%>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="RepeatFrequencyHourly" />
                <asp:AsyncPostBackTrigger ControlID="RepeatFrequencyDaily" />
                <asp:AsyncPostBackTrigger ControlID="RepeatFrequencyWeekly" />
                <asp:AsyncPostBackTrigger ControlID="RepeatFrequencyMonthly" />
                <asp:AsyncPostBackTrigger ControlID="RepeatFrequencyYearly" />
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="RecurrenceFrequencyPanel" runat="server" CssClass="rsAdvRecurrenceFreq">
                    <ul>
                        <li>
                            <asp:RadioButton ID="RepeatFrequencyHourly" runat="server" ResourceKey="Hourly" GroupName="RepeatFrequency" AutoPostBack="true" Checked="true" />
                        </li>
                        <li>
                            <asp:RadioButton ID="RepeatFrequencyDaily" runat="server" ResourceKey="Daily" GroupName="RepeatFrequency" AutoPostBack="true" />
                        </li>
                        <li>
                            <asp:RadioButton ID="RepeatFrequencyWeekly" runat="server" ResourceKey="Weekly" GroupName="RepeatFrequency" AutoPostBack="true" />
                        </li>
                        <li>
                            <asp:RadioButton ID="RepeatFrequencyMonthly" runat="server" ResourceKey="Monthly" GroupName="RepeatFrequency" AutoPostBack="true" />
                        </li>
                        <li>
                            <asp:RadioButton ID="RepeatFrequencyYearly" runat="server" ResourceKey="Yearly" GroupName="RepeatFrequency" AutoPostBack="true" />
                        </li>
                    </ul>
                </asp:Panel>
                <asp:MultiView ID="RecurrencePatternMultiView" runat="server" ActiveViewIndex="0">
                    <asp:View ID="RecurrencePatternHourlyView" runat="server">
                        <asp:Panel ID="RecurrencePatternHourlyPanel" runat="server" CssClass="rsAdvHourly">
                            <ul>
                                <li>
                                    <%=Localize("Every")%><asp:TextBox ID="HourlyRepeatInterval" runat="server" Text="1" CssClass="rsAdvInput" /><%=Localize("Hours")%>
                                </li>
                            </ul>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="RecurrencePatternDailyView" runat="server">
                        <asp:Panel ID="RecurrencePatternDailyPanel" runat="server" CssClass="rsAdvDaily">
                            <ul>
                                <li>
                                    <asp:RadioButton ID="RepeatEveryNthDay" runat="server" Checked="true" ResourceKey="Every" GroupName="DailyRecurrenceDetailRadioGroup" /><asp:TextBox ID="DailyRepeatInterval" runat="server" Text="1" CssClass="rsAdvInput" /><%=Localize("Days")%>
                                </li>
                                <li>
                                    <asp:RadioButton ID="RepeatEveryWeekday" runat="server" Checked="false" ResourceKey="EveryWeekday" GroupName="DailyRecurrenceDetailRadioGroup" />
                                </li>
                            </ul>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="RecurrencePatternWeeklyView" runat="server">
                        <asp:Panel ID="RecurrencePatternWeeklyPanel" runat="server" CssClass="rsAdvWeekly">
                            <ul>
                                <li>
                                    <%=Localize("RecurEvery")%><asp:TextBox ID="WeeklyRepeatInterval" runat="server" CssClass="rsAdvInput" Text="1" /><%=Localize("Weeks")%>
                                </li>
                                <li class="rsAdvWeekly_Weekday">
                                    <asp:CheckBox ID="WeeklyWeekDayMonday" runat="server" CssClass="rsAdvCheckboxWrapper" ResourceKey="Monday" />
                                </li>
                                <li class="rsAdvWeekly_Weekday">
                                    <asp:CheckBox ID="WeeklyWeekDayTuesday" runat="server" CssClass="rsAdvCheckboxWrapper" ResourceKey="Tuesday" />
                                </li>
                                <li class="rsAdvWeekly_Weekday">
                                    <asp:CheckBox ID="WeeklyWeekDayWednesday" runat="server" CssClass="rsAdvCheckboxWrapper" ResourceKey="Wednesday" />
                                </li>
                                <li class="rsAdvWeekly_Weekday">
                                    <asp:CheckBox ID="WeeklyWeekDayThursday" runat="server" CssClass="rsAdvCheckboxWrapper" ResourceKey="Thursday" />
                                </li>
                                <li class="rsAdvWeekly_Weekday">
                                    <asp:CheckBox ID="WeeklyWeekDayFriday" runat="server" CssClass="rsAdvCheckboxWrapper" ResourceKey="Friday" />
                                </li>
                                <li class="rsAdvWeekly_Weekday">
                                    <asp:CheckBox ID="WeeklyWeekDaySaturday" runat="server" CssClass="rsAdvCheckboxWrapper" ResourceKey="Saturday" />
                                </li>
                                <li class="rsAdvWeekly_Weekday">
                                    <asp:CheckBox ID="WeeklyWeekDaySunday" runat="server" CssClass="rsAdvCheckboxWrapper" ResourceKey="Sunday" />
                                </li>
                            </ul>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="RecurrencePatternMonthlyView" runat="server">
                        <asp:Panel ID="RecurrencePatternMonthlyPanel" runat="server" CssClass="rsAdvMonthly">
                            <ul>
                                <li>
                                    <asp:RadioButton ID="RepeatEveryNthMonthOnDate" runat="server" Checked="true" ResourceKey="Day" GroupName="MonthlyRecurrenceRadioGroup" /><asp:TextBox ID="MonthlyRepeatDate" runat="server" Text="1" CssClass="rsAdvInput" /><%=Localize("OfEvery")%><asp:TextBox ID="MonthlyRepeatIntervalForDate" runat="server" Text="1" CssClass="rsAdvInput" /><%=Localize("Months")%>
                                </li>
                                <li>
                                    <asp:RadioButton ID="RepeatEveryNthMonthOnGivenDay" runat="server" ResourceKey="The" GroupName="MonthlyRecurrenceRadioGroup" /><asp:DropDownList ID="MonthlyDayOrdinalDropDown" runat="server" ></asp:DropDownList><asp:DropDownList ID="MonthlyDayMaskDropDown" runat="server" ></asp:DropDownList><%=Localize("OfEvery")%><asp:TextBox ID="MonthlyRepeatIntervalForGivenDay" runat="server" Text="1" CssClass="rsAdvInput" /><%=Localize("Months")%>
                                </li>
                            </ul>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="RecurrencePatternYearlyView" runat="server">
                        <asp:Panel ID="RecurrencePatternYearlyPanel" runat="server" CssClass="rsAdvYearly">
                            <ul>
                                <li>
                                    <asp:RadioButton ID="RepeatEveryYearOnDate" runat="server" Checked="true" ResourceKey="Every" GroupName="YearlyRecurrenceRadioGroup" /><asp:DropDownList ID="YearlyRepeatMonthForDate" runat="server" ></asp:DropDownList><asp:TextBox ID="YearlyRepeatDate" runat="server" Text="1" CssClass="rsAdvInput" />
                                </li>
                                <li>
                                    <asp:RadioButton ID="RepeatEveryYearOnGivenDay" runat="server" ResourceKey="The" GroupName="YearlyRecurrenceRadioGroup" /><asp:DropDownList ID="YearlyDayOrdinalDropDown" runat="server" ></asp:DropDownList><asp:DropDownList ID="YearlyDayMaskDropDown" runat="server" ></asp:DropDownList><%=Localize("Of")%><asp:DropDownList ID="YearlyRepeatMonthForGivenDay" runat="server" ></asp:DropDownList>
                                </li>
                            </ul>
                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="RecurrenceRangePanel" runat="server" CssClass="rsAdvRecurrenceRangePanel">
        <p class="rsAdvRecurrenceRange"><strong><%=Localize("Range")%></strong></p>
        <ul>
            <li>
                <asp:RadioButton ID="RepeatIndefinitely" runat="server" ResourceKey="NoEndDate" Checked="true" GroupName="RecurrenceRangeRadioGroup" />
            </li>
            <li>
                <asp:RadioButton ID="RepeatGivenOccurrences" runat="server" ResourceKey="EndAfter" GroupName="RecurrenceRangeRadioGroup" /><asp:TextBox ID="RangeOccurrences" runat="server" CssClass="rsAdvInput" /><%=Localize("Occurrences")%>
            </li>
            <li>
                <asp:RadioButton ID="RepeatUntilGivenDate" runat="server" ResourceKey="EndByThisDate" GroupName="RecurrenceRangeRadioGroup" /><telerik:RadDatePicker ID="RangeEndDate" runat="server" CssClass="rsAdvInput" Width="100"><Calendar ShowRowHeaders="false"/></telerik:RadDatePicker>
            </li>
        </ul>
    </asp:Panel>
</div>