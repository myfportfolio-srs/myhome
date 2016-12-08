<?php

foreach (glob("functions/*.php") as $filename)
{
    require_once $filename;
}
