using MimeKit;

message.From.Add(new MailboxAddress("morgan.nyman@elecosoft.com"));
message.To.Add(new MailboxAddress(args[1]));

message.Subject = args[2];

var message = new MimeMessage();

bool insert = false;

message.Body = new TextPart(TextFormat.Plain) {
	Text = args[3];
}

using var smtp = new SmtpClient();
await smtp.ConnectAsync("localhost", 1025);
await smtp.SendAsync(message);
await smtp.DisconnectAsync(true);
Console.WriteLine("Mail sent!");

