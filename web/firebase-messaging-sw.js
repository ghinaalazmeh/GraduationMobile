importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
firebase.initializeApp({
    apiKey: 'AIzaSyAhJebwH8IbwAJaUAXjFdXKCMh9YyZrqLk',
    authDomain: 'firstproject-787.firebaseapp.com',
    projectId: 'firstproject-787',
    storageBucket: 'firstproject-787.appspot.com',
    messagingSenderId: '253656148946',
    appId: '1:253656148946:web:a079d6220b2e5c797a760b',
    measurementId: 'G-CMD9LPMQ0J',
});

messaging = firebase.messaging();

messaging.onBackgroundMessage((m) => {
    console.log("onBackgroundMessage", m);
  });