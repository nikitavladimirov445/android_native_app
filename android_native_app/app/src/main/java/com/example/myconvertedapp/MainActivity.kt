package com.example.myconvertedapp

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent

// Import the LoginScreen composable from the other file
import com.example.myconvertedapp.LoginScreen

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            LoginScreen() // Now this reference will be resolved
        }
    }
}
