<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="SignUp"
        android:textSize="34sp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.46"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.091" />

    <EditText
        android:id="@+id/editTextTextEmailAddress"
        android:layout_width="222dp"
        android:layout_height="63dp"
        android:ems="10"
        android:hint="enteremail"
        android:inputType="textEmailAddress"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.239" />

    <EditText
        android:id="@+id/editTextTextPassword"
        android:layout_width="219dp"
        android:layout_height="54dp"
        android:ems="10"
        android:hint="enter password"
        android:inputType="textPassword"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.494"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.385" />

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="SignUp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.546" />

</androidx.constraintlayout.widget.ConstraintLayout>




package com.example.loginapplication;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText email, pass;
    Button signup;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        email = findViewById(R.id.editTextTextEmailAddress);
        pass = findViewById(R.id.editTextTextPassword);
        signup = findViewById(R.id.button);

        SharedPreferences pref = getSharedPreferences("user", MODE_PRIVATE);

        signup.setOnClickListener(v -> {

            String e = email.getText().toString();
            String p = pass.getText().toString();

            if (e.isEmpty() || p.isEmpty()) {
                Toast.makeText(this, "Fill all fields", Toast.LENGTH_SHORT).show();
                return;
            }

            if (!isValidPassword(p)) {
                Toast.makeText(this, "Password must have 8 chars, uppercase, lowercase, number & special", Toast.LENGTH_LONG).show();
                return;
            }

            pref.edit().putString("u", e).putString("p", p).apply();

            Toast.makeText(this, "SignUp Successful", Toast.LENGTH_SHORT).show();
            startActivity(new Intent(this, LoginActivity2.class));
        });
    }

    private boolean isValidPassword(String p) {
        return p.length() >= 8 &&
                p.matches(".*[A-Z].*") &&
                p.matches(".*[a-z].*") &&
                p.matches(".*[0-9].*") &&
                p.matches(".*[@#$%^&+=!*.?_()].*");
    }
}



<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".LoginActivity2">

    <TextView
        android:id="@+id/textView2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Login"
        android:textSize="34sp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.47"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.123" />

    <EditText
        android:id="@+id/editTextTextEmailAddress2"
        android:layout_width="213dp"
        android:layout_height="61dp"
        android:ems="10"
        android:hint="enteremail"
        android:inputType="textEmailAddress"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.552"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.31" />

    <EditText
        android:id="@+id/editTextTextPassword2"
        android:layout_width="235dp"
        android:layout_height="54dp"
        android:ems="10"
        android:hint="enter passwrd"
        android:inputType="textPassword"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.5" />

    <Button
        android:id="@+id/button2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="loginIn"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.537"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.664" />
</androidx.constraintlayout.widget.ConstraintLayout>



package com.example.loginapplication;



import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class LoginActivity2 extends AppCompatActivity {

    int attempts = 2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login2);

        EditText ue = findViewById(R.id.editTextTextEmailAddress2);
        EditText up = findViewById(R.id.editTextTextPassword2);
        Button login = findViewById(R.id.button2);

        SharedPreferences pref = getSharedPreferences("user", MODE_PRIVATE);
        String savedU = pref.getString("u", "");
        String savedP = pref.getString("p", "");

        login.setOnClickListener(v -> {

            if (attempts == 0) {
                Toast.makeText(this, "Failed Login Attempts", Toast.LENGTH_SHORT).show();
                login.setEnabled(false);
                return;
            }

            if (ue.getText().toString().equals(savedU) &&
                    up.getText().toString().equals(savedP)) {

                startActivity(new Intent(this, loginsuccessActivity2.class));
            } else {
                attempts--;
                Toast.makeText(this, "Login Failed", Toast.LENGTH_SHORT).show();
            }
        });
    }
}



<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".loginsuccessActivity2">

    <TextView
        android:id="@+id/textView3"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="LoginSuccessful"
        android:textSize="34sp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.496"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.142" />


</androidx.constraintlayout.widget.ConstraintLayout>

package com.example.loginapplication;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

public class loginsuccessActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_loginsuccess2);
    }
}
