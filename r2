import { useState } from "react";
import { Button, Input, Card, CardContent } from "@/components/ui";
import { FaCar, FaMotorcycle } from "react-icons/fa";
import { IoMdPerson } from "react-icons/io";
import { motion } from "framer-motion";

export default function RideShare() {
  const [userType, setUserType] = useState("consumer");
  const [phone, setPhone] = useState("");
  const [otp, setOtp] = useState("");
  const [verified, setVerified] = useState(false);

  const handleVerify = () => {
    if (otp === "1234") setVerified(true); // Mock verification
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center p-4 bg-gray-100">
      <Card className="w-full max-w-md p-6 shadow-lg">
        <CardContent>
          <h2 className="text-xl font-bold text-center mb-4">Lift Ride Sharing</h2>
          <div className="flex justify-center gap-4 mb-4">
            <Button variant={userType === "driver" ? "default" : "outline"} onClick={() => setUserType("driver")}>
              <FaCar className="mr-2" /> Driver
            </Button>
            <Button variant={userType === "consumer" ? "default" : "outline"} onClick={() => setUserType("consumer")}>
              <IoMdPerson className="mr-2" /> Consumer
            </Button>
          </div>
          
          <Input
            type="tel"
            placeholder="Enter phone number"
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
            className="mb-3"
          />
          <Button onClick={() => alert("OTP sent: 1234")}>Send OTP</Button>
          
          <Input
            type="text"
            placeholder="Enter OTP"
            value={otp}
            onChange={(e) => setOtp(e.target.value)}
            className="mt-3"
          />
          <Button onClick={handleVerify} className="mt-3">Verify</Button>
          
          {verified && userType === "driver" && (
            <div className="mt-4">
              <Input type="text" placeholder="Vehicle Name" className="mb-2" />
              <Input type="text" placeholder="Vehicle Number" className="mb-2" />
              <Input type="file" accept="image/*" className="mb-2" />
              <Button>Submit Details</Button>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
