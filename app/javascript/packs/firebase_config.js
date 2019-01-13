import Firebase from 'firebase'

/*
https://github.com/vuejs/vuefire/issues/21

Yeah it does make sense, I was afraid of doing so in each component thinking it would be bad for the performance because I am inizializing the firebaseApp in each component. Dunno if Webpack takes care of that. If I use vuexfire I inizialize it only once and then pass the firebase objects via props?

@microcipcip Yeah, I was worried about the same, but then think about it - you're essentially initialising a Firebase instance per component with the data only that component cares about. Trying to pass Firebase instances around could get messy really fast. The Webpack production build seems to be quite efficient.

import Firebase from 'firebase'

  const firebaseApp = Firebase.initializeApp({ databaseURL: '<YOUR-FIREBASE_URL>' })
  const db = firebaseApp.database()
  const messagesRef = db.ref('messages')

  export default {
    data () {
      return {
        newMessage: ''
      }
    },
    firebase: {
      messages: messagesRef
    },
    etc.
    etc.




    I dont want to initialize a new firebase instance for each component, that was my initial problem.

You don't have to.

I dont believe that Vue, a very sophisticated framework dont allow us to use DRY.

Of course it does. Or rather - JS modules allow you that.

Simply initialize the Firbase instance in its own module once, and export it from there. Then you can import this instance in every component as needed:

//.db.js
import Firebase from 'firebase'
const firebaseApp = Firebase.initializeApp({ [[FIREBASE_CONFIG]] })
const db = firebaseApp.database()
export default db

// in your component:
import './db'

export default {
  firebase {
    example: db.ref('example')
  }
}

modules are only "executed" once - wherever in the programm they are imported first. subsequent imports will simply receive a reference to the result of the first one.


*/


var firebase_config = {
    apiKey: "AIzaSyBNAKY0msBtQGYqUyn6gnEtKGEdOzbg7Ho",
    authDomain: "summongrid.firebaseapp.com",
    databaseURL: "https://summongrid.firebaseio.com",
    projectId: "summongrid",
    storageBucket: "summongrid.appspot.com",
    messagingSenderId: "1042849663553"
    //authToken?
    //connectionRoot?
    //connectionRootPrivate?
};

const firebaseApp = Firebase.initializeApp(firebase_config)
const firebaseAuth = Firebase.auth()
//var firebaseRef = firebaseApp.database().ref(firebase_config.connectionRoot);

firebaseAuth.onAuthStateChanged((user) => {
    if (user && user.uid) {
      console.log("FIREBASE auth state changed. I am now", user.uid);
    } else {
      console.log("FIREBASE auth state changed. I have no uid.");
    }
});

firebaseApp.auth().signInAnonymously();
firebaseApp.auth().setPersistence("session");

const db = firebaseApp.database();

export default db
/*
export {
    firebaseApp,
    firebaseAuth,
    firebaseRef
}
*/
//export const db = firebaseApp.database(); //  This didn't work and I don't know why... 
