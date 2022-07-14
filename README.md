# pepulTask_socialapp


**iOS Developer Task :**

Hi,

We will give you the requirements for an app - a simple basic app. You will need to read the

requirements carefully, understand and build the app.

\- Below are the requirements,

● Make an App with simple two screens. First screen shows data retrieved from

**Retrieve data call** in a grid collection with continuous scrolling.

● On a single tap of an item, take the exact item to the next screen and show content

as full screen. Add gesture to dismiss and return to the first screen.

● On long press of item, shows popup for item deletion (**Delete data call**) and after

completion, refresh collection and scroll continuously.

**Base API Details :**

Base Url = "<https://nextgenerationsocialnetwork.com/user_details/>"

**Retrieve data call :**

● For initial calls, keep lastFetchId as an empty string and then on consecutive calls

use last object id as lastFetchId.

API : select.php

Input parameter : {"lastFetchId" : id}

sample response:

{

"statusCode": 200,

"message": "success",

"data": [

{

"id": "192",

"file":

"<https://nextgenerationsocialnetwork.com/user_details/uploads/25024378.mp4>",

"file\_type": "1"

},

{

"id": "191",

"file":

"<https://nextgenerationsocialnetwork.com/user_details/uploads/14319525.jpg>",

"file\_type": "0"

},

{

"id": "190",

"file":

"<https://nextgenerationsocialnetwork.com/user_details/uploads/37849473.mp4>",

"file\_type": "1"

}

]

}





**Delete data call :**

API : delete.php

Input parameter : {"id": id}

sample success response:

{

"message": "Success",

"statusCode": 200

}

sample error response:

{

"message": "user already deleted",

"statusCode": 400

}

We will be evaluating the following things,

● The Design (simple, beautiful and professional)

● Animation and smoothness (don't overdo it!)

● Correctness of data

● Clean code

● Swift language proficiency

● Architecture usage (must be MVVM)

● Complicated/Latest component usage

● Handling memory leaks and efficiency

● Coding proficiency and knowledge on iOS Technology

● List of impressive things you have implemented

After completion, share your project as a zip file and also Link to the **Github** repository

of your code.

All the best

Thanks


