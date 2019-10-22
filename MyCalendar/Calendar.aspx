<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="MyCalendar.Calendar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="/assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style>

.dropdown-toggle:active, .open .dropdown-toggle {
    outline: 0;
}

        .calendar-container {
            height: 85vh;
        }

        .external-event .fc-event {
            margin: 5px 0;
            cursor: move;
            font-size: 1em !important;
            line-height: 1.5;
            padding: 2px;
        }
    </style>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                         
                        <li class="active"><a href="/MainPage.aspx">My Calendar</a></li>
                        <li><a href="/Calendar.aspx">Calendar</a></li>
                        <li><a href="/ListMeeting.aspx">List Meetings</a></li>
                        <li><a href="/AddMeeting.aspx">Add Meetings</a></li>
                        <li><a href="/ListCustomer.aspx">List Customer</a></li>
                        <li><a href="/AddCustomer.aspx">Add Customer</a></li>
                    </ul>


                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome,<asp:Literal ID="lblUsername" runat="server"></asp:Literal><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/MyInfo.aspx"><i class="icon-envelope"></i>Profile</a></li>
                                <li class="divider"></li>
                                <li><a href="/Logout.aspx"><i class="icon-off"></i>Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <div class="row" style="margin: 0px;">
            <div class="col-sm-2">
                <div class='calendar-container'>
                    <div class="widget-box transparent">
                        <div class="widget-header">
                            <h4>Customers</h4>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">

                                <div id="external-events">
                                    <div class="external-event" data-class="label-success">
                                        <asp:Repeater ID="rptCust" runat="server">
                                            <ItemTemplate>
                                                <div class="block-box fc-event" data-event='<%# "{ \"title\": \"" + Eval("Name") + "\", \"customerID\": \"" + Eval("Id") + "\" }" %>'>
                                                    <%# Eval("Name") %>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-10">
                <div class='calendar-container'>
                    <div id="dvCalendar"></div>
                </div>
            </div>
        </div>

        <script src="/Scripts/jquery-1.9.1.min.js"></script>
        <script src="/Scripts/bootstrap.min.js"></script>
        <link href='/assets/fullcalendar-4.2.0/core/main.min.css' rel="stylesheet" />
        <link href='/assets/fullcalendar-4.2.0/daygrid/main.min.css' rel="stylesheet" />
        <link href='/assets/fullcalendar-4.2.0/timegrid/main.min.css' rel="stylesheet" />
        <link href='/assets/fullcalendar-4.2.0/list/main.min.css' rel="stylesheet" />

        <script src='/assets/fullcalendar-4.2.0/core/main.min.js'></script>
        <script src='/assets/fullcalendar-4.2.0/interaction/main.min.js'></script>
        <script src='/assets/fullcalendar-4.2.0/daygrid/main.min.js'></script>
        <script src='/assets/fullcalendar-4.2.0/timegrid/main.min.js'></script>
        <script src='/assets/fullcalendar-4.2.0/list/main.min.js'></script>
        <script src='/assets/fullcalendar-4.2.0/core/locales/tr.js'></script>
        <script type="text/javascript">

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(InitializePage);
            var calendar;
            var dateDuration = '00:30';
            var dateDurationNumber = "30";
            function InitializePage() {

                //drag eventlarının tetiklendiği  yer
                var containerEvent = document.getElementById("external-events");
                var containerDraggable = new FullCalendarInteraction.Draggable(containerEvent, {
                    itemSelector: '.block-box',
                    eventData: function (eventEl) {
                        var jData = JSON.parse(eventEl.dataset.event);
                        return {
                            id: 0,
                            title: jData.title,
                            customerID: jData.customerID,
                            duration: dateDuration,
                            allDay: false,
                            editable: true,
                            color: "#FFB752"
                        };
                    }
                });
                document.addEventListener('DOMContentLoaded', function () {
                    //$(document).ready(function () {
                    var calendarEl = document.getElementById("dvCalendar")
                    calendar = new FullCalendar.Calendar(calendarEl, {
                        locale: 'tr',
                        plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
                        height: 'parent',
                        header: {
                            left: 'prev, next, today',
                            center: 'title',
                            right: 'dayGridMonth, timeGridWeek, timeGridDay, listWeek'
                        },
                        defaultView: 'timeGridWeek',
                        slotDuration: dateDuration,
                        slotLabelInterval: dateDuration,
                        minTime: "07:00",
                        maxTime: '20:00',
                        scrollTime: "08:00",
                        firstDay: 1,
                        editable: true,
                        eventLimit: false,
                        droppable: false,
                        drop: function (info) {
                            var jData = JSON.parse(info.draggedEl.dataset.event);
                            var jsonData = {};
                            jsonData.date = info.date.toLocaleString();
                            jsonData.duration = dateDurationNumber;
                            jsonData.customerID = jData.customerID;
                            jsonData.isMonth = calendar.view.view.type == 'dayGridMonth' ? "1" : "0";
                            debugger;
                            $.ajax({
                                type: "POST",
                                url: '/Visit.asmx/NewVisit',
                                cache: false,
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify(jsonData),
                                success: function (data) { // new visitten dönen değere bakar
                                    if (data.d == "NOK") {
                                        alert('Error', "Başka bir ziyaret ile çakışmaktadır!", null, null);
                                    }
                                    else {
                                        UpdateCalendar();
                                    }
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert('Error', "Bilgiler güncellenemedi", null, null);
                                },
                                complete: function (jqXHR, textStatus, errorThrown) {
                                    info.view.calendar.getEventById(0).remove();
                                }
                            });
                        },
                        events: function (info, successCallback, failureCallback) {
                            var jsonData = {};
                            jsonData.dateStart = info.start.format('dd.MM.yyyy');
                            jsonData.dateEnd = info.end.format('dd.MM.yyyy');
                            $.ajax({
                                url: '/Visit.asmx/GetVisitCalendar',
                                data: JSON.stringify(jsonData),
                                dataType: "json",
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {
                                    successCallback(
                                        $(data.d).map(function (index, item) {
                                            return {
                                                id: item.id,
                                                title: item.title,
                                                start: item.start,
                                                end: item.end,
                                                allDay: false,
                                                duration: item.duration,
                                                editable: item.editable,
                                                color: item.color
                                            };
                                        })
                                    )
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    failureCallback(errorThrown);
                                    alert('Bilgiler yüklenemedi');
                                }
                            });
                        },
                        eventDrop: function (info) {
                            var jsonData = {};
                            jsonData.id = info.event.id;
                            jsonData.milliseconds = info.delta.milliseconds.toString();
                            jsonData.days = info.delta.days.toString();
                            debugger;
                            $.ajax({
                                type: "POST",
                                url: '/Visit.asmx/FirmVisitUpdateEventDrop',
                                cache: false,
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify(jsonData),
                                success: function (data) {
                                    if (data.d == "OK") {

                                    }
                                    else {
                                        alert('Error', data.d, null, null);
                                        info.revert();
                                    }
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert('Bilgiler güncellenemedi');
                                    info.revert();
                                }
                            });
                        },
                        eventResize: function (info) {
                            var jsonData = {};
                            jsonData.id = info.event.id;
                            jsonData.milliseconds = info.endDelta.milliseconds;
                            $.ajax({
                                type: "POST",
                                url: '/Visit.asmx/FirmVisitUpdateEventResize',
                                cache: false,
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify(jsonData),
                                success: function (data) {
                                    if (data.d == "OK") {

                                    }
                                    else {
                                        alert('Error', data.d, null, null);
                                        revertFunc();
                                    }
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert('Bilgiler güncellenemedi');
                                    revertFunc();
                                    debugger;
                                }
                            });
                        },
                        eventRender: function (info) {
                            $(info.el).bind('dblclick', function () {
                                window.location = '/CalendarDetail.aspx?ID=' + info.event.id;
                            });
                        }
                    });
                    calendar.render();
                });
            }

            function UpdateCalendar() {
                calendar.refetchEvents();
            }
            InitializePage();
        </script>
    </form>
    
 
</body>
</html>


