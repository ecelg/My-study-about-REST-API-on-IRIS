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
|Business Process|the object that you can design you bussiness (message) flow<br> By making the flow, rules, transformation, lookup, coding, you can do whatever you want to process the message|
|Business Operation|a gateway waiting message trigger from inside (inside the production)|

<br>
In the above exmaple, our Postman is the one who trigger the message. <br> 
In order to join the party, we should try to let the REST message pass to the Business Service Side.<br>
After that, we can adjust the rounting logic inside the Business Process and it is suppose that my Postman will be able to talk to the other Existing interfaces on IRIS <br>
### Ok... lets start Session 2 and try to **Join the Party**.

## Session 2 - Connect the REST API interface to IRIS production
In this Session, we will try to pass the REST resuest to the Bussiness service of the Production<br>
For a beginner like me... It is a pretty hard concept before you learn sth about message (I am not sure if I am mastering it correctly so far...) <br>
I am trying my best to tell you my understanding about the concept of messaging and **you are welcome to give me feedback**<br>
**OH!!!** I forgot, other then messaging, there is another concept of adapter...**OMG** ... Maybe I need to explain this one as well.<br>
<br>
In this session, a very improtant thing, we **assume that if we can pass our REST request to BS(business service), update the logic on the BPL(business process logic), we can talk to all the existing interfaces in the Production**. <br>
<br>
#### What is Adapter
Just throw away the how to exchange messages betweens different interfaces, it is tooooooo far away from us at this moment.<br>
Let talk about how can we connect to a interface. (or how to connect to different interfaces)<br>
<br>
The tools is adapter!!<br>
As we know both BS(business service) and BO(business operations) are both gateways, in order to talk to different kinds of interface, we need to equipt an adapter to the BS or BO.<br>
[link to official document](https://github.com/ecelg/My-study-about-REST-API-on-IRIS/blob/main/README.md), to me ... only for my reference, I am the type who can only learn from example..... I am so sorry to the technical writter....<br>
<br>
![aboutadapter](https://user-images.githubusercontent.com/107917928/179452445-3b04fb75-01bb-47c1-9217-f3e462f5711c.png)<br>
<br>
**OHHHHHH!!** forgot to tell, there are **2** types of adapter, Inbound Adapter, Outbound Adapter...<br>
I am sorry to let you know that I got really confunsed between them at the beginning (the BS and BO also). <br>
That's why I would like to use my way to explain it a little bit more before start doing sth...<br>
<br>
**sth important** (which made me confused)
- both of the Inbound Adapter and Outbound Adapter can send message to ouside
- both of the Inbound Adapter and Outbound Adapter can send message from ouside

I think the picture below might give you a better idea about the different between 2 kind of adapter<br>
Take ***HTTP Inbound Adapter*** as an example, this adapter helps to pickup the HTTP request messages from outside (the production)<br>
and then pass the messages to our BS(business services). Remeber I mentioned before, BS is the guy who is standing beside the door, waiting the message trigger from ouside (the production).<br>
After some processing, there maybe a response from BS side and pass to the HTTP Inbound Adapter, which return a HTTP response message to the one who make request<br>

![image](https://user-images.githubusercontent.com/107917928/179456446-71edc650-2054-4096-b48d-538181a03793.png)<br>
<br>
For the ***HTTP Outbound Adapter***, its sth similar, it pickup the request message for BO(business operation), make a HTTP request messages to the outside (the production).<br>
When there is respones from the outside, convert the response message to the BO<br>
<br>

##### For using the inbound adapter, you just simpily add the parameter in your BS class<br>
![Inbound adapter](https://user-images.githubusercontent.com/107917928/179455984-418dbb53-6941-42e6-b34b-f1d534052c0b.png)<br>
<br>
##### For using the outbound adapter, you just simpily add the parameter in your BO class<br>
![outboundadapter](https://user-images.githubusercontent.com/107917928/179455995-23a49fc8-ff71-4641-8697-80d172d91944.png)<br>
<br>

#### Concept about messages
Message is a key element which help to do the infoamtion exchange between the Business Services, Business Process, and Business Operation<br>
Basically, there are two kinds of messages<br>
- Request Message, create by the trigger side
- Respones Message, create by the response side

In order to make sth happen, a Request Message is a must.<br>
In a Sync Resquest, a Response is required. (e.g. a REST resuest)<br>
In a Async Request, a Response is not required. (e.g. export a file)<br>
![image](https://user-images.githubusercontent.com/107917928/179491675-07c4f991-cb4b-4ba6-9154-7c1b8ecd148b.png)


