package com.xbox.sdk.inter;

import android.content.Intent;

public abstract interface IActivityCallback
{
  public abstract void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent);

  public abstract void onBackPressed();

  public abstract void onCreate();

  public abstract void onDestroy();

  public abstract void onNewIntent(Intent paramIntent);

  public abstract void onPause();

  public abstract void onRestart();

  public abstract void onResume();

  public abstract void onStart();

  public abstract void onStop();
}