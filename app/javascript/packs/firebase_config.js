import Firebase from 'firebase'

//firebase_config is created in 'show.html.erb' as it is built from the rails credentials.
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
