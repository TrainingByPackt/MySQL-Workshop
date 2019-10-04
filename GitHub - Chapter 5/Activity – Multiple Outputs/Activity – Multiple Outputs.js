//Include modules
var fs = require('fs');     //File System
var http = require('http'); //http 

//Create a file and assign it to stream
var stream = fs.createWriteStream("Activity1.txt");

//Write data to the file
  stream.write("The Web server is monitoring port 82\n");
  stream.write(Date.now() + "\n\n");
  stream.write("Scintilate Scintilate globule vivific \n");
  stream.write("Fain should I fathom your nature specific \n");
  stream.write("Loftily poised in ether capacious\n");
  stream.write("Stringly resembling some gem carbonacious \n\n");
  stream.write("Something to think about :)\n\n");
  stream.write("Did you notice the backslash n combination forces a new line?\n");
  stream.write("Well done :)");

  //Close the file
  stream.end();

//Write a message to the console
console.log("Web server is monitoring port 82");


//Create the server to monitor port 82
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});

  //Send the response when a request is received
  res.end('Twinkle twinkle little star, the world is at your feet - ' + Date.now());

  //Closes off the bracketing for the server, instruct to listen on port 82
}).listen(82);
