## Before starting, let's talk sth else

In the pervious session, we have setup a rest intreface which directly reach the table/class method on IRIS.
![afterstep4looklike](https://user-images.githubusercontent.com/107917928/179402368-a5ca06df-cdea-4e7e-a851-d7e8192b74c5.png)<br>

In reality, we might not only interested in querying data from IRIS only. Let's consider the following case<br>
There might me sereval other systems, applications, dbs, UI, files systems, IOT devices, etc connecting to iris at the same time.<br>
Sometimes, may want to talk to them directly.<br>
How can we do that? You may simply **Join the Party!!** and let somebody help you to do the<br>
- message routing (maybe sometime filtering)
- message translating (you know, you might talk to a non English speaker)
- message processing (maybe you need to ask A and then B and the gather the answer to figure out what question to ask C....)
- message processing (maybe your name is Kate when you are talk to your teacher, but KK when you are talking to your friend, sbd need to help you to correct it before the message send out)
- message recording (you might found out sth important and store it for future reference)

and maybe there are more things sbd can help (it is sth I come up so far)<br>
![somebodyhelptocommuncate](https://user-images.githubusercontent.com/107917928/179439916-3808cb3f-97c5-4b68-8fea-994cbf84b9f5.png)


We know that somebody is living inside IRIS<br>
- IRIS can connet to different systems easily
- Some interfaces can even connect by no code configuration
- it is possible to exchange messages between systems

So, who is the somebody inside IRIS?<br>

To be frank, I got very confused at the beginning.... The somebody seems to be Ensamble? Interoperability? Production? BS? BP? BO??????<br>
So many names.....so confusing...<br>
Let's have a brieft idea here (I am sorry, I am still in the learning stage....)<br>
![insdidesomebody](https://user-images.githubusercontent.com/107917928/179446937-65075078-f2ae-41aa-a953-07b33d563f96.png)<br>
This is what I know so far about somebody, the Interoperability (Ensamble - old name) , Production, BS(business service), BP (Business process), BO (Business Operation) .<br>
In brief <br>

|Object |Description |
|--|--|
|Business Service|a gateway waiting message trigger from outide (outside the production)|
|Business Process|the object that you can design you bussiness (message) flow<br> By making the flow, rules, transformation, lookup, coding, you cn do whatever you want to process the message|
|Business Operation|a gateway waiting message trigger from inside (inside the production)|

<br>
In the above exmaple, our Postman is the one who trigger the message. <br> 
In order to join the party, we should try to let the REST message pass to the Business Service Side.<br>
After that, we can adjust the rounting logic inside the Business Process and it is suppose that my Postman will be able to talk to the other Existing interfaces on IRIS <br>

## Session 2 - Connect the REST API interface to IRIS production
