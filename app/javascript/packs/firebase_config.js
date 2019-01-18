import Firebase from 'firebase'

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
