<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class AudioCallEvent
{
    use Dispatchable, SerializesModels;

    public $token;
    public $userId;

    public function __construct($token, $userId)
    {
        $this->token = $token;
        $this->userId = $userId;
    }

    public function broadcastOn()
    {
        return new Channel('audio-call-channel');
    }
}
