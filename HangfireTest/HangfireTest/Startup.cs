using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Hangfire;

[assembly: OwinStartup(typeof(HangfireTest.Startup))]

namespace HangfireTest
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // For more information on how to configure your application, visit http://go.microsoft.com/fwlink/?LinkID=316888

            GlobalConfiguration.Configuration
                .UseSqlServerStorage(@"Server=.\SQL2012; Database=Hangfire; Uid=sa; Pwd=123456");

            app.UseHangfireDashboard();
            app.UseHangfireServer();

            // http://hangfire.io/
            RecurringJob.AddOrUpdate(() => Console.WriteLine("Check bitcoin wallet at " + DateTime.Today.ToString()), Hangfire.Cron.MinuteInterval(2));
        }
    }
}
